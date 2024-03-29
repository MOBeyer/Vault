//
//  ToolbarViewController.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import UIKit

// Tunable parameters
let toolbarWidth : CGFloat = 175
let toolbarRowHeight : CGFloat = 44
let sectionHeaderHeight : CGFloat = 0
let separatorColor : UIColor = UIColor(named: "separator") ?? UIColor.init(red: 0.587, green: 0.604, blue: 0.596, alpha: 0.49)
let cellTextColor : UIColor = UIColor.init(red: 0.965, green: 0.224, blue: 0.145, alpha: 1.0)
let toolbarAnimationDuration : TimeInterval = 0.20

public protocol ToolbarViewControllerDelegate {
    func toolbarDidSelectTool(toolbar: ToolbarViewController, tool: Tool)
}

internal protocol ToolbarViewDelegate {
    func toolbarViewDidMoveToSuperview(toolbarView: ToolbarView, superview: UIView?)
}

internal class ToolbarView : UIView {
    internal var tableView : UITableView?
    internal var toolbarViewDelegate : ToolbarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 22.0
        self.clipsToBounds = true

        let tv = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        tv.backgroundColor = UIColor.clear
        tv.rowHeight = toolbarRowHeight
        tv.isScrollEnabled = false
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            let lightBlurEffect = UIBlurEffect.init(style: .extraLight)
            let effectView = UIVisualEffectView.init(effect: lightBlurEffect)
            if #available(iOS 13.0, *) {
                effectView.effect = UIBlurEffect(style: .systemMaterial)
            }
            effectView.frame = CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            self.addSubview(effectView)
            
            tv.separatorEffect = UIVibrancyEffect.init(blurEffect: lightBlurEffect)
            if #available(iOS 13.0, *) {
                tv.separatorEffect = UIVibrancyEffect.init(blurEffect: UIBlurEffect(style: .systemMaterial))
            }
            effectView.contentView.addSubview(tv)
        }
        else {
            self.addSubview(tv)
        }

        self.tableView = tv
        
        NSLayoutConstraint.activate([
            tv.topAnchor.constraint(equalTo: self.topAnchor),
            tv.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tv.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tv.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tv.widthAnchor.constraint(equalToConstant: frame.size.width),
            tv.heightAnchor.constraint(equalToConstant: frame.size.height)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init(coder:) has not been implemented for ToolbarView")
        return nil
    }
    
    override func didMoveToSuperview() {
        toolbarViewDelegate?.toolbarViewDidMoveToSuperview(toolbarView: self, superview: self.superview)
    }
}

public class ToolbarViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, ToolbarViewDelegate {
    static func allSystemTools() -> Array<Tool> {
        return Array<Tool>(arrayLiteral: Tool.move, Tool.erase)
    }
    
    public var systemTools = ToolbarViewController.allSystemTools()
    public var userTools = Array<Tool>()
    public var delegate : ToolbarViewControllerDelegate? = nil
    public var includeSystemTools : Bool = true {
        didSet {
            if includeSystemTools == false {
                systemTools.removeAll()
                lastSelectedTool = nil
            }
            else {
                systemTools.append(contentsOf: ToolbarViewController.allSystemTools())
            }
        }
    }
    private var lastSelectedTool : Tool?
    private var heightConstraint : NSLayoutConstraint? = nil
    private var toolbarIsCollapsed : Bool = false {
        didSet {
            view.isAccessibilityElement = toolbarIsCollapsed
            if toolbarIsCollapsed {
                let singleToolMenu = (systemTools.count + userTools.count == 1)
                if let lastTool = lastSelectedTool {
                    if singleToolMenu {
                        view.accessibilityLabel = String(format: NSLocalizedString("Tool menu, selected tool, %@", comment: "AX label: single tool menu"), lastTool.name)
                        view.accessibilityIdentifier = "ToolbarViewController.singleTool.selected: \(lastTool.name)"
                    }
                    else {
                        view.accessibilityLabel = String(format: NSLocalizedString("Tool menu, collapsed, currently selected tool, %@", comment: "AX label: multi tool menu"), lastTool.name)
                        view.accessibilityIdentifier = "ToolbarViewController.multiTool.selected: \(lastTool.name)"
                    }
                }
                else {
                    view.accessibilityLabel = NSLocalizedString("Tool menu, collapsed, no tool currently selected", comment: "AX label")
                    view.accessibilityIdentifier = "ToolbarViewController.tool.noSelection"
                }
                
                if !singleToolMenu {
                    view.accessibilityHint = NSLocalizedString("Double-press to open", comment: "AX hint: tool menu")
                }
            }
            else {
                if let tbv = view as? ToolbarView {
                    UIAccessibility.post(notification: .layoutChanged, argument: tbv.tableView)
                }
            }
        }
    }
    // Table view cell used to display the active tool when the toolbar is collapsed.
    private var activeToolTableViewCell = UITableViewCell(style: .default, reuseIdentifier: nil)

    
    public override func loadView() {
        let numberOfRows = systemTools.count + userTools.count
        let tbHeight = (toolbarRowHeight * CGFloat(numberOfRows)) + ((userTools.count > 0 && systemTools.count > 0) ? sectionHeaderHeight : 0)
        let tbv = ToolbarView.init(frame: CGRect(x: -toolbarWidth, y: controlsMargin, width: toolbarWidth, height: tbHeight))
        tbv.toolbarViewDelegate = self
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.tableView?.delegate = self
        tbv.tableView?.dataSource = self
        tbv.tableView?.sectionHeaderHeight = sectionHeaderHeight
        tbv.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "toolbarcell")
        self.view = tbv
        
        self.heightConstraint = tbv.heightAnchor.constraint(equalToConstant: tbHeight)
        NSLayoutConstraint.activate([
            self.heightConstraint!
            ])
        
        if numberOfRows >= 1 && lastSelectedTool == nil {
            // Always select the first tool (unless we’ve previously selected one). We assign it as the currently selected tool later when the menu moves into its selected collapsed state
            lastSelectedTool = userTools.count != 0 ? userTools.first! : (systemTools.count != 0 ? systemTools.first! : nil)
        }
    }

    public override func viewWillAppear(_ animated: Bool) {
        if let _ = lastSelectedTool {
            // If we have a lastSelectedTool, we need to force the tableview to layout a bit prematurely (so we can correctly position the menu in a collapsed state)
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }

        super.viewWillAppear(animated)
    }

    // viewDidAppear is too late for this to happen, the animation to pull the menu on-screen is already happening. But the view needs to be in the hierarchy so that constraints work correctly.
    internal func toolbarViewDidMoveToSuperview(toolbarView: ToolbarView, superview: UIView?) {
        guard superview != nil else { return }

        let numberOfRows = systemTools.count + userTools.count
        if let lastTool = lastSelectedTool {
            if let idxPath = indexPathForTool(tool: lastTool) {
                if numberOfRows > 1 { // nothing to animate if there’s only one row
                    UIView.performWithoutAnimation {
                        animateToolbarForSelectionOfItem(at: idxPath)
                    }
                }
                else {
                    toolbarIsCollapsed = true // effectively true for a 1-tool menu
                }
                delegate?.toolbarDidSelectTool(toolbar: self, tool: toolForIndexPath(indexPath: idxPath))
            }
            else {
                delegate?.toolbarDidSelectTool(toolbar: self, tool: lastTool)
            }
        }
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userTools.count
        }
        else {
            return systemTools.count
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toolbarcell", for: indexPath)
        configure(cell: cell, for: indexPath)
        return cell
    }
    
    private func configure(cell: UITableViewCell, for indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = self.view.tintColor
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 18, bottom: 0, right: 0)
        
        cell.selectedBackgroundView = {
            var v : UIView? = nil
            if !UIAccessibility.isReduceTransparencyEnabled {
                v = UIVisualEffectView.init(effect: UIBlurEffect.init(style: .dark))
                v!.frame = cell.bounds
            }
            else {
                v = UIView.init(frame: cell.bounds)
                v!.backgroundColor = UIColor.init(red: 0.329, green: 0.537, blue: 0.553, alpha: 1.0)
            }
            
            if indexPath.section == 0 && indexPath.row == 0 {
                maskCorners(view: v!, corners: [.topLeft, .topRight])
            }
            
            if indexPath.section == 1 && indexPath.row == 1 {
                maskCorners(view: v!, corners: [.bottomLeft, .bottomRight])
            }
            
            return v
        }()
        
        let tool = toolForIndexPath(indexPath: indexPath)
        cell.imageView?.image = imageForTool(tool: tool)
        cell.textLabel?.text = tool.name
        
        if indexPath.section == 0 && indexPath.row == userTools.count - 1 ||
            indexPath.section == 1 && indexPath.row == systemTools.count - 1 {
            // Hide the last separator of each section
            cell.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: toolbarWidth + 10)
        }

        cell.accessibilityLabel = String(format:NSLocalizedString("%@ tool", comment:"AX label: tool description using name"), tool.name)
        cell.accessibilityHint = NSLocalizedString("Double-press to select", comment:"AX hint: individual tool")
        cell.accessibilityIdentifier = "ToolbarViewController.tool.\(tool.name)"
    }
    
    private func imageForTool(tool: Tool) -> UIImage? {
        if let systemTool = tool as? SystemTool, let icon = systemTool.icon {
            return UIImage(named: icon.path)?.withRenderingMode(.alwaysTemplate)
        }
        else {
            return UIImage.image(text: tool.emojiIcon)
        }
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view : UIView? = nil
        if section == 1 {
            view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.width, height: tableView.bounds.height))
            view?.backgroundColor = separatorColor
        }
        return view
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat = 0
        if section == 1 && userTools.count > 0 {
            height = sectionHeaderHeight
        }
        return height
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        // Prevent single-tool menus from highlighting or being selectable
        if (userTools.count == 1 && systemTools.count == 0) {
            return false
        }
        return true
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath) != nil {
            let selectedTool = self.toolForIndexPath(indexPath: indexPath)
            if let delegate = self.delegate {
                delegate.toolbarDidSelectTool(toolbar: self, tool: selectedTool)
            }
            tableView.deselectRow(at: indexPath, animated: true)
            animateToolbarForSelectionOfItem(at: indexPath)
            self.lastSelectedTool = selectedTool
        }
    }
    
    private func toolForIndexPath(indexPath: IndexPath) -> Tool {
        var tool : Tool
        if indexPath.section == 0 {
            tool = userTools[indexPath.row]
        }
        else {
            tool = systemTools[indexPath.row]
        }
        
        return tool
    }
    
    private func indexPathForTool(tool: Tool) -> IndexPath? {
        if let idx = userTools.firstIndex(of: tool) {
            return IndexPath(row: idx, section: 0)
        }
        else if let idx = systemTools.firstIndex(of: tool) {
            return IndexPath(row:idx, section: 1)
        }

        return nil
    }

    // Details we need to perform the collapse/expansion of the toolbar
    private var selectedCellDeets : (CGPoint, CGSize, Array<NSLayoutConstraint>)?
    
    private func animateToolbarForSelectionOfItem(at indexPath: IndexPath) {
        guard let toolbarView = self.view as? ToolbarView else { fatalError("Cannot coerce toolbar view to ToolbarView") }
        guard let tableView = toolbarView.tableView else { fatalError("ToolbarView does not have a table view") }
        guard let tableViewCell = tableView.cellForRow(at: indexPath) else { fatalError("Table view does not have a cell for indexPath \(indexPath)") }
        
        let cellFrameInToolbarView = tableViewCell.convert(tableViewCell.bounds, to: toolbarView)
        
        // Configure the active tool cell to match the cell that’s selected in the table view.
        let cell = activeToolTableViewCell
        self.configure(cell: cell, for: indexPath)
        
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: toolbarWidth + 10)
        
        UIView.animate(withDuration: toolbarAnimationDuration, delay: 0.0, options: .curveLinear, animations: { 
            // Resize the toolbar
            self.heightConstraint?.constant = toolbarRowHeight
            
            UIView.performWithoutAnimation {
                // Add the active tool cell to the toolbar.
                toolbarView.addSubview(cell)
                cell.translatesAutoresizingMaskIntoConstraints = false
                
                // Position the cell at the top of the collapsed toolbar
                let cellConstraints = [cell.topAnchor.constraint(equalTo: toolbarView.topAnchor, constant:0),
                                        cell.leadingAnchor.constraint(equalTo: toolbarView.leadingAnchor, constant:-1),
                                        cell.widthAnchor.constraint(equalToConstant: cellFrameInToolbarView.size.width),
                                        cell.heightAnchor.constraint(equalToConstant: cellFrameInToolbarView.size.height)
                                        ]
                
                NSLayoutConstraint.activate(cellConstraints)
                
                self.selectedCellDeets = (cellFrameInToolbarView.origin, toolbarView.frame.size, cellConstraints)
            }
            
            // Set the table view hidden
            tableView.alpha = 0.0

            // Trigger all constraints to animate
            toolbarView.superview?.layoutIfNeeded()

        }, completion: { (didComplete : Bool) in
            // Animate in the disclosure view once we’ve settled in the collapsed state
            let disclosureView = UIImageView(image: UIImage(named: "disclosure")?.withRenderingMode(.alwaysTemplate))
            disclosureView.alpha = 0.0
            cell.accessoryView = disclosureView
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: { 
                disclosureView.alpha = 1.0
            }, completion: nil)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(ToolbarViewController.expandToolbar(tapGesture:)))
            cell.addGestureRecognizer(tap)
            self.toolbarIsCollapsed = didComplete
        })
    }
    
    @objc(expandToolbar:)
    private func expandToolbar(tapGesture: UITapGestureRecognizer) {
        guard let (cellOrigin, toolbarOriginalSize, cellConstraints) = self.selectedCellDeets else { fatalError("No cell animation details available") }
        guard let toolbarView = self.view as? ToolbarView else { fatalError("Cannot coerce toolbar view to ToolbarView") }
        guard let tableView = toolbarView.tableView else { fatalError("ToolbarView does not have a table view") }
        guard let cell = tapGesture.view as? UITableViewCell else { fatalError("Tap gesture’s view is not a table cell") }
        
        // Unhide the table view after a slight delay as to not interfere with the rest of the animation
        UIView.animate(withDuration: toolbarAnimationDuration * 0.2, delay: toolbarAnimationDuration * 0.8, options: .curveLinear, animations: { 
            tableView.alpha = 1.0
            }, completion: nil)

        // Hide the disclosure chevron a bit quicker
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: { 
            cell.accessoryView?.alpha = 0.0
            }, completion: nil)
        
        UIView.animate(withDuration: toolbarAnimationDuration, delay: 0.0, options: .curveLinear, animations: { 
            self.heightConstraint?.constant = toolbarOriginalSize.height
            cellConstraints[0].constant = cellOrigin.y

            toolbarView.superview?.layoutIfNeeded()
        },
        completion: { (didComplete : Bool) in
            // Remove the active tool cell from the toolbar.
            cell.removeFromSuperview()
            cell.accessoryView = nil
            
            // Undo all the constraint magic we did above.
            cell.translatesAutoresizingMaskIntoConstraints = true
            NSLayoutConstraint.deactivate(cellConstraints)
            
            self.toolbarIsCollapsed = !didComplete
        })

        self.selectedCellDeets = nil
        tapGesture.view?.removeGestureRecognizer(tapGesture)
    }
}

private func maskCorners(view : UIView, corners : UIRectCorner) {
    let bPath = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize.init(width: 19.0, height: 19.0))
    let maskLayer = CAShapeLayer()
    maskLayer.path = bPath.cgPath
    view.layer.mask = maskLayer
}



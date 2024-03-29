//
//  Game.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

/**
 Represents a single game. This also handles all action taken by the AI
 as well as the SceneKit aspects of the UI.
  - localizationKey: Game
 */
public class Game: GridDelegate {
    // MARK: Internal properties
    
    private var placedShips: [Ship]!
    
    /// All the sunken ships in the game.
    /// - localizationKey: Game.sunkShips
    public var sunkShips: [Ship] {
        return placedShips.filter { $0.isSunk }
    }
    
    /// All of the unsunk ships in the game. Try to hit these!
    /// - localizationKey: Game.unsunkShips
    public var unsunkShips: [Ship] {
        return placedShips.filter { !($0.isSunk) }
    }
    
    private var mode: GameMode = .interactive {
        didSet {
            if mode == .completed {
                delegate?.gameDidComplete(self)
            }
        }
    }
    
    private let gameAI: GameAI?
    
    private var targettedCoordinate: Coordinate?
    
    private let shootDelay: TimeInterval
    
    // MARK: Public properties
    
    /// The game’s grid.
    /// - localizationKey: Game.grid
    public let grid: Grid

    /// The amount of turns taken in the game.
    /// - localizationKey: Game.turnCount
    public private(set) var turnCount = 0 {
        didSet {
            delegate?.gameDidTakeTurn(self)
        }
    }
    
    weak var delegate: GameDelegate?
    
    // MARK: Initialization
    
    public init(coordinateSize: Int, gameAI: GameAI? = nil, shootDelay: TimeInterval = 0.0) {
        self.shootDelay = shootDelay
        grid = Grid(coordinateSize: coordinateSize)
        self.gameAI = gameAI
        
        self.gameAI?.game = self

        // Place ships on the grid.
        placedShips = placeShips()

        // Register for as a delegate for user interactions with the grid.
        grid.gridDelegate = self
    }
    
    // MARK:
    
    internal func complete() {
        guard mode == .interactive else { return }

        guard let target = targettedCoordinate else { return }

        mode = .simulating
        shoot(at: target)
    }
    
    internal func markNextSuggestedTarget() -> Coordinate? {
        guard let gameAI = gameAI else { return nil }
        
        // Clear any previously suggested target.
        if let previousTarget = targettedCoordinate {
            let tile = grid.tileAt(previousTarget)
            if tile.state == .suggested {
                tile.state = .unexplored
            }
        }
        
        var nextSuggestion: Coordinate
        
        if let previousCoordinate = targettedCoordinate, grid.coordinateIsValid(previousCoordinate) {
            // Use the targetting function to determine where to shoot next.
            let previousTile = grid.tileAt(previousCoordinate)
            nextSuggestion = gameAI.nextCoordinate(previousTile: previousTile)
        }
        else {
            nextSuggestion = gameAI.firstCoordinate()
        }

        // Mark the associated tile as suggested.
        let tile = grid.tileAt(nextSuggestion)
        if tile.state == .unexplored {
            tile.state = .suggested
        }

        targettedCoordinate = nextSuggestion
        return nextSuggestion
    }
    
    private func shoot(at target: Coordinate) {
        guard grid.coordinateIsValid(target) else { return }
        
        let tile = grid.tileAt(target)
        
        if tile.state == .unexplored || tile.state == .suggested {
            // Increment the turn count.
            turnCount += 1
            
            // Check if the coordinate hits a ship.
            let tile = grid.tileAt(target)
            if let ship = tile.ship {
                tile.state = .hit
                ship.damage += 1
            }
            else {
                tile.state = .miss
            }

            // Check if all ships have been sunk and the game is complete.
            if sunkShips.count == placedShips.count {
                mode = .completed
                return
            }
        }
        
        // Mark the next suggested target.
        if let nextTarget = markNextSuggestedTarget() {
            // If the current mode is `simulating`, shoot at the suggested target.
            if mode == .simulating {
                if shootDelay < 0.1 {
                    shoot(at: nextTarget)
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.shoot(at: nextTarget)
                    }
                }
            }
        }
    }
    
    // MARK: GridDelegate
    
    func grid(_ grid: Grid, didTouch coordinate: Coordinate) {
        // Do nothing if there are no ships left to sink
        guard !unsunkShips.isEmpty else { return }
        
        if let suggestion = grid.coordinates(withState: .suggested).first {
            // If targets are being suggested, shoot at the suggestion
            shoot(at: suggestion)
        }
        else {
            // The user is deciding where to shoot, shoot at the tile they touched.
            shoot(at: coordinate)
        }
    }
}

internal protocol GameDelegate: class {
    func gameDidComplete(_ game: Game)
    func gameDidTakeTurn(_ game: Game)
}

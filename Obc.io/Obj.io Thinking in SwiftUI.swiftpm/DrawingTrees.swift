//
//  File.swift
//  Thinking in SwiftUI
//
//  Created by Moritz Beyer on 01.03.22.
//
/*
import SwiftUI

struct Tree<A> {
    var value: A
    var children: [Tree<A>] = []
    init(_ value: A, children: [Tree<A>] = []) {
        self.value = value
        self.children = children
    }
}

let binaryTree = Tree<Int>(50, children: [
    Tree(17, children: [
        Tree(12),
        Tree(23)
    ]),
    Tree(72, children: [
        Tree(54),
        Tree(72)
    ])
])


struct DiagramSimple<A: Identifiable, V: View>: View {
    let tree: Tree<A>
    let node: (A) -> V

    var body: some View {
        return VStack(alignment: .center) {
            node(tree.value)
            HStack(alignment: .bottom, spacing: 10) {
                ForEach(tree.children, id: \.value.id, content: { child in
                    DiagramSimple(tree: child, node: self.node)
                })
            }
        }
    }
}

class Unique<A>: Identifiable {
    let value: A
    init(_ value: A) { self.value = value }
}

extension Tree {
    func map<B>(_ transform: (A) -> B) -> Tree<B> {
        Tree<B>(transform(value), children: children.map { $0.map(transform) })
    }
}

let uniqueTree: Tree<Unique<Int>> = binaryTree.map(Unique.init)

struct TreeDiagramView: View {
    @State var tree = uniqueTree
    var body: some View {
        DiagramSimple(tree: tree, node: { value in
            Text("\(value.value)")
        })
    }
}

struct TreeDiagramView_Previews: PreviewProvider {
    static var previews: some View {
        TreeDiagramView()
    }
}
*/

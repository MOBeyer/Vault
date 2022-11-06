//
//  File.swift
//  Thinking in SwiftUI
//
//  Created by Moritz Beyer on 01.03.22.
//

import SwiftUI

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

let uniqueTree = binaryTree.map(Unique.init)

struct RoundedCircleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .background(Circle().stroke())
            .background(Circle().fill(Color.white))
            .padding(10)
    }
}

extension Tree where A == Unique<Int> {
    mutating func insert(_ number: Int) {
        if number < value.value {
            if children.count > 0 {
                children[0].insert(number)
            } else {
                children.append(Tree(Unique(number)))
            }
        } else {
            if children.count == 2 {
                children[1].insert(number)
            } else if children.count == 1 && children[0].value.value > number {
                children[0].insert(number)
            } else {
                children.append(Tree(Unique(number)))
            }
        }
    }
}

struct BinaryTreeView: View {
    @State var tree = uniqueTree
       var body: some View {
           VStack {
               Button(action: {
                   withAnimation(.default) {
                       self.tree.insert(Int.random(in: 0...100))
                   }
               }, label: { Text("Insert random number") })
               Diagram(tree: tree, node: { value in
                   Text("\(value.value)")
                       .modifier(RoundedCircleStyle())
               })
           }
       }
}

struct BinaryTreeContentView: View {
    var body: some View {
        BinaryTreeView()
    }
}

struct BinaryTreeContentView_Preview: PreviewProvider {
    static var previews: some View {
        BinaryTreeContentView()
    }
}

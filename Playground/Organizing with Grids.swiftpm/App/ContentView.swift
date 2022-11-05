//#-learning-task(contentView)
//#-learning-task(stateVariable)

import SwiftUI

/*#-code-walkthrough(2.contentView)*/
struct ContentView: View {
    /*#-code-walkthrough(2.contentView)*/
    /*#-code-walkthrough(2.columnLayout)*/
    let columnLayout = Array(repeating: GridItem(), count: 3)
    /*#-code-walkthrough(2.columnLayout)*/

    /*#-code-walkthrough(3.stateVar)*/
    @State private var selectedColor = Color.gray
    /*#-code-walkthrough(3.stateVar)*/

    /*#-code-walkthrough(2.allColors)*/
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]
    /*#-code-walkthrough(2.allColors)*/

    /*#-code-walkthrough(2.body)*/
    var body: some View {
        /*#-code-walkthrough(2.body)*/
        /*#-code-walkthrough(2.vStack)*/
        VStack {
            /*#-code-walkthrough(2.vStack)*/
            Text("Selected Color")
                .font(.body)
                .fontWeight(.semibold)
            /*#-code-walkthrough(3.selectedColor)*/
                .foregroundColor(selectedColor)
            /*#-code-walkthrough(3.selectedColor)*/
                .padding(10)
            
            /*#-code-walkthrough(2.scrollView)*/
            ScrollView {
                /*#-code-walkthrough(2.scrollView)*/
                /*#-code-walkthrough(2.lazyVGrid)*/
                LazyVGrid(columns: columnLayout) {
                    /*#-code-walkthrough(2.lazyVGrid)*/
                    /*#-code-walkthrough(2.gridForEach)*/
                    ForEach(allColors.indices, id: \.self) { index in
                        /*#-code-walkthrough(2.gridForEach)*/
                        /*#-code-walkthrough(2.gridElement)*/
                        Button {
                            /*#-code-walkthrough(3.colorChange)*/
                            selectedColor = allColors[index]
                            /*#-code-walkthrough(3.colorChange)*/
                        } label: {
                            /*#-code-walkthrough(2.gridLabel)*/
                            RoundedRectangle(cornerRadius: 4.0)
                                .aspectRatio(1.0, contentMode: ContentMode.fit)
                                .foregroundColor(allColors[index])
                            /*#-code-walkthrough(2.gridLabel)*/
                        }
                        .buttonStyle(.plain)
                        /*#-code-walkthrough(2.gridElement)*/
                    }
                }
            }
        }
        .padding(10)
    }
}

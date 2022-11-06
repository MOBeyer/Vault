import SwiftUI

struct EmojiMemoryGameView: View {
    @ObsrvedObject var game: EmojiMemoryGame
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .stroke(lineWidth: 3)
                    Text(card.content)
                        .font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape
                        .fill()
                }
            }
        }
    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstant.fontScale)
    }
    
    private struct DrawingConstant {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}

//
//  File.swift
//  Stanford Memory SwiftUI
//
//  Created by Moritz Beyer on 07.05.22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["✌","😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬","🐟","🍀","👀","🚗"]
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
        /*
         Problem: Cannot use instance member 'emojis' within property initializer; property initializers run before 'self' is available
         
         Solution: "static" emojis = [ ... ]
         
         Question: Why do we call it static? Why not call it type property?
         
         Because we want to emphasize the class and not the property itself
         
         */

    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intent
    func choose(_ cards: MemoryGame<String>.Card) {
        model.choose(cards)
    } 
}

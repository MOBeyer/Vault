//
//  MemoryGame.swift
//  Stanford Memory Game
//
//  Created by Moritz Beyer on 09.11.22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}

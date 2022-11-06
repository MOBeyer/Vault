import Foundation

// TODO: Functional Programming
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    // MARK: Thema Optional in action -> Closures?
    private var indexOfTheOnlyFaceUpCard: Int? { 
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue ) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           
            // FIXME: choose func not working. -> Wrong name for property
            // Cannot convert value of type 'MemoryGame<CardContent>.Card' to expected argument type 'Int'
            
            // FIXME: Lecture 5 00:42
            !cards[chosenIndex].isFaceUp, 
            !cards[chosenIndex].isMatched 
        {
            
            
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content ==
                    cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // TODO: Type inference advanced
        // Knows that this is an empty array of cards
        // add number of pairsOfPairsCards x 2 cards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            
            /*
             Problem: Missing argumant for parameter "id" in call
             
             Solution: Need to add the unque identifier to the cards.append
             */
            
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    struct Card: Identifiable {
        
        // MARK:     ObjectIdentifier Generic! -> Hashable, Equatable
        let id: Int
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}

extension Array {
    //.             Arrays "dont care"
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}

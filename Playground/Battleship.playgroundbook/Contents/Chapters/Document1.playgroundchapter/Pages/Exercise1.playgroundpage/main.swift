//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 This playground explores a modified, one-player form of Battleship.
 
 In the two-player form of the game, each player guesses the locations of the other player’s ships on a grid and fires on them. The first player to correctly guess all the locations and sink the other player’s ships wins.
 
 In this playground, when you start playing Battleship, the 10x10 grid is hidden and five ships are placed randomly on the grid. Your goal is to write an algorithm to find and sink those ships using the fewest turns possible. For each turn, you can fire at one tile. If you hit a ship, a flame icon appears; otherwise, that tile has an “X” on it.
 
 There are five ships of different lengths, all one tile wide. Listed by width, the boats are:
 - (2 tiles) Patrol boat
 - (3 tiles) Submarine
 - (3 tiles) Destroyer
 - (4 tiles) Battleship
 - (5 tiles) Aircraft carrier
 
 On this page, you can try playing Battleship before you start writing your algorithm.
 
 **To play:** Run the code and then touch the tiles you want to fire at. Keep firing until you sink all the ships and the game ends.
 
 Think about how you might create a set of rules for where to fire next. When you’re ready, go to the next page to start creating your rules.
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, playGame())
//#-code-completion(identifier, hide, AllCases)

import PlaygroundSupport

var _playGameCalled = false

/// Starts the Battleship game.
/// - localizationKey: playGame()
func playGame() {
    _playGameCalled = true
}

//#-end-hidden-code
//#-editable-code
playGame()
//#-end-editable-code
//#-hidden-code

if _playGameCalled {
    let viewController = GameViewController.instantiateFromStoryboard()
    PlaygroundPage.current.liveView = viewController
}

//#-end-hidden-code

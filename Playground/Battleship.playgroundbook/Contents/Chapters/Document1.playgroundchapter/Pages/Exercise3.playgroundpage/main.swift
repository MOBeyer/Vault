//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Minimize the number of turns needed for your algorithm to win.
 
 You can further improve your algorithm by making better guesses at finding undiscovered ships. There are a few ways to do this.
 
 **Consider ship size**
 1. Keep track of the smallest ship, which takes up two tiles.
 2. Fire at every other tile across the grid, targeting only spaces where the ship could fit.
 3. If you sink the ship, modify your algorithm to target areas where the next smallest ship (three tiles) can fit.
 4. Fire at every third tile, targeting only spaces where the ship could be.
 
 **Determine probability of a ship existing at a tile**
 1. Calculate the number of remaining ships that can be placed on each tile and their possible orientations (horizontal or vertical). The sum of the number of ships and their possible orientations is the score for a tile. When the game starts, every tile has a score of 10, because all 5 ships can fit vertically or horizontally on it.
 2. Fire at the tile with the highest score.
 3. For each turn, recalculate each tile’s score and repeat until you hit a ship.
 
 Try using one of these methods, or experiment on your own to see what else works better. Simulate your algorithm and see how much you can improve it!
 
 When you’re ready, you can [try another challenge](playgrounds://featured). Good luck!
 */

//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, game, grid, return)
//#-code-completion(currentmodule, show)
//#-code-completion(bookauxiliarymodule, show)
//#-code-completion(identifier, show, if, func, var, let, ., =, <=, >=, <, >, ==, !=, +, -, true, false, &&, ||, !, *, /, while, for, (, ), ())
//#-code-completion(identifier, hide, AllCases)

import PlaygroundSupport

class MyAI: GameAI {
    weak var game: Game!
    
    var grid: Grid {
        return game.grid
    }
    
    init() {}
    
//#-end-hidden-code
//#-editable-code
//#-localizable-zone(localizableCommentsPart1Page3)
// A coordinate that represents the origin of a targeted search.
//#-end-localizable-zone
var tileToFollowFrom = Tile()

//#-localizable-zone(localizableCommentsPart2Page3)
// The directions to follow to search for a ship.
//#-end-localizable-zone
var directionsToFollow = [Direction]()

func firstCoordinate() -> Coordinate {
    return grid.randomCoordinate()
}

func nextCoordinate(previousTile: Tile) -> Coordinate {
//#-localizable-zone(localizableCommentsPart3Page3)
    // Check if we’re following in a direction from a hit tile.
//#-end-localizable-zone
    if directionsToFollow.isEmpty {
//#-localizable-zone(localizableCommentsPart4Page3)
        // We’re not following in any direction; if the previous target wasn’t a hit, return a random coordinate.
//#-end-localizable-zone
        if previousTile.state != .hit {
            return grid.randomCoordinate()
        }
        
//#-localizable-zone(localizableCommentsPart5Page3)
        // Start following the neighbors of the hit tile in all directions.
//#-end-localizable-zone
        tileToFollowFrom = previousTile
        directionsToFollow = [.north, .south, .east, .west]
    }
    
//#-localizable-zone(localizableCommentsPart6Page3)
    // Determine which neighboring tile we should target next.
//#-end-localizable-zone
    var tileToCheck = previousTile
    while !directionsToFollow.isEmpty {
//#-localizable-zone(localizableCommentsPart7Page3)
        // Get the current direction we’re following.
//#-end-localizable-zone
        let directionToFollow = directionsToFollow[0]
        
//#-localizable-zone(localizableCommentsPart8Page3)
        // If the previous target was a hit, try to target the next tile in the same direction.
//#-end-localizable-zone
        if tileToCheck.state == .hit {
            let neighborCoordinate = tileToCheck.coordinate.advanced(by: 1, inDirection: directionToFollow)
            let neighborTile = grid.tileAt(neighborCoordinate)
            
//#-localizable-zone(localizableCommentsPart9Page3)
            // If the tile hasn’t been targeted previously, target it next.
//#-end-localizable-zone
            if neighborTile.state == .unexplored {
                return neighborCoordinate
            }
        }
        
//#-localizable-zone(localizableCommentsPart10Page3)
        // We’ve exhausted the tiles in the current direction; remove it from the array and move on to the next direction.
//#-end-localizable-zone
        directionsToFollow.removeFirst()
        tileToCheck = tileToFollowFrom
    }
    
//#-localizable-zone(localizableCommentsPart11Page3)
    // No target was found in any direction; return a random coordinate.
//#-end-localizable-zone
    return grid.randomCoordinate()
}
//#-end-editable-code
//#-hidden-code
}

let viewController = GameViewController.instantiateFromStoryboard()
viewController.createGameAI = {
    return MyAI()
}

PlaygroundPage.current.liveView = viewController
//#-end-hidden-code

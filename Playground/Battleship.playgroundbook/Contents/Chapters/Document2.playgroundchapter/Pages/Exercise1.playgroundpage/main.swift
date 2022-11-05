//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 At the bottom of this page is an example algorithm that distributes its random guesses based on the smallest possible ship sizes (the first method on the previous page). It works in two ways.
 
 **Guess mode (when no ship is found)**
 1. Keep track of the smallest ship, which takes up two tiles.
 2. Fire at every other tile across the grid, targeting only spaces where the ship could fit.
 3. If you sink the ship, modify your algorithm to target areas where the next smallest ship (three tiles) can fit.
 4. Fire at every third tile, targeting only spaces where the ship could be.
 
 **Target mode (when a ship is found)**
 1. Fire at the tiles around where the ship was hit.
 2. After all of the nearby tiles are targeted and the ship and any neighboring ships are destroyed, return to guess mode.
 
 Keep in mind that this is just one option for writing an algorithm for Battleship; many other options exist. Explore and try to improve your algorithm so you can win in even fewer turns!
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, game, grid, return )
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
//#-localizable-zone(localizableCommentsPart1ExamplePage)
// A coordinate that represents the origin of a targeted search.
//#-end-localizable-zone
var tileToFollowFrom = Tile()
    
//#-localizable-zone(localizableCommentsPart2ExamplePage)
// The directions to search for a ship.
//#-end-localizable-zone
var directionsToFollow = [Direction]()

func firstCoordinate() -> Coordinate {
    return Coordinate(column: 0, row: 0)
}

func nextCoordinate(previousTile: Tile) -> Coordinate {
//#-localizable-zone(localizableCommentsPart3ExamplePage)
    // Check if we’re following in a direction from a hit tile.
//#-end-localizable-zone
    if directionsToFollow.isEmpty {
//#-localizable-zone(localizableCommentsPart4ExamplePage)
        // We’re not following in any direction; if the previous target wasn’t a hit, return a random coordinate.
//#-end-localizable-zone
        if previousTile.state != .hit {
            return nextGuessCoordinate(previousTile: previousTile)
        }
        
//#-localizable-zone(localizableCommentsPart5ExamplePage)
        // Start following the neighbors of the hit tile in all directions.
//#-end-localizable-zone
        tileToFollowFrom = previousTile
        directionsToFollow = Direction.allCases
    }
    
//#-localizable-zone(localizableCommentsPart6ExamplePage)
    // Determine which neighboring tile to target next.
//#-end-localizable-zone
    var tileToCheck = previousTile
    while !directionsToFollow.isEmpty {
//#-localizable-zone(localizableCommentsPart7ExamplePage)
        // If the previous target was a hit, try to target the next tile in the direction we’re following.
//#-end-localizable-zone
        if tileToCheck.state == .hit {
            let directionToFollow = directionsToFollow[0]
            let neighborCoordinate = tileToCheck.coordinate.advanced(by: 1, inDirection: directionToFollow)
            let neighborTile = grid.tileAt(neighborCoordinate)
            
//#-localizable-zone(localizableCommentsPart8ExamplePage)
            // If the tile hasn’t been targeted previously, target it next.
//#-end-localizable-zone
            if neighborTile.state == .unexplored {
                return neighborCoordinate
            }
        }
        
//#-localizable-zone(localizableCommentsPart9ExamplePage)
        // The tiles in the current direction have been exhausted; remove that direction from the array, and move on to the next one.
//#-end-localizable-zone
        directionsToFollow.removeFirst()
        tileToCheck = tileToFollowFrom
    }
    
//#-localizable-zone(localizableCommentsPart10ExamplePage)
    // No target was found in any direction; return a random coordinate.
//#-end-localizable-zone
    return nextGuessCoordinate(previousTile: previousTile)
}

//#-localizable-zone(localizableCommentsPart11ExamplePage)
// This function is called when the previous targeted tile wasn’t a hit.
    //#-end-localizable-zone
func nextGuessCoordinate(previousTile: Tile) -> Coordinate {
//#-localizable-zone(localizableCommentsPart12ExamplePage)
    // Determine the shortest ship that is still afloat.
//#-end-localizable-zone
    let smallestUnsunkShip = getSmallestUnsunkShip()
    
//#-localizable-zone(localizableCommentsPart13ExamplePage)
    // Loop through all rows, starting at the row of the previous tile.
//#-end-localizable-zone
    for row in previousTile.coordinate.row ..< grid.rowCount {
//#-localizable-zone(localizableCommentsPart14ExamplePage)
        // Determine which column to start checking from.
//#-end-localizable-zone
        var column: Int
        if row == previousTile.coordinate.row {
//#-localizable-zone(localizableCommentsPart15ExamplePage)
            // This is the same row as the previous tile; start after the previous tile’s column.
//#-end-localizable-zone
            column = previousTile.coordinate.column + smallestUnsunkShip.length
        } else {
            column = startingColumnForRow(row: row)
        }
        
//#-localizable-zone(localizableCommentsPart16ExamplePage)
        // Loop through the coordinates for each column in the current row.
//#-end-localizable-zone
        while column < grid.columnCount {
//#-localizable-zone(localizableCommentsPart17ExamplePage)
            // Get the coordinate and its tile.
//#-end-localizable-zone
            let coordinate = Coordinate(column: column, row: row)
            let tile = grid.tileAt(coordinate)
            
            if tile.state == .unexplored {
//#-localizable-zone(localizableCommentsPart18ExamplePage)
                // Check all directions to see if there’s space for the shortest unsunk ship.
//#-end-localizable-zone
                for direction in Direction.allCases {
//#-localizable-zone(localizableCommentsPart19ExamplePage)
                    // If there’s room for the shortest unsunk ship, return the coordinate.
//#-end-localizable-zone
                    let tileCount = possibleHitCountFrom(coordinate: coordinate, inDirection: direction)
                    if tileCount >= smallestUnsunkShip.length {
                        return coordinate
                    }
                }
                
//#-localizable-zone(localizableCommentsPart20ExamplePage)
                // Skip the length of the shortest unsunk ship before checking again.
//#-end-localizable-zone
                column += smallestUnsunkShip.length
            } else {
//#-localizable-zone(localizableCommentsPart21ExamplePage)
                // Move on to the next column.
//#-end-localizable-zone
                column += 1
            }
            
        }
    }
    
//#-localizable-zone(localizableCommentsPart22ExamplePage)
    // The last column was reached; return the first unexplored tile in the grid.
//#-end-localizable-zone
    for tile in grid.allTiles {
        if tile.state == .unexplored {
            return tile.coordinate
        }
    }
    
//#-localizable-zone(localizableCommentsPart23ExamplePage)
    // We should never reach this point, so return an invalid tile.
//#-end-localizable-zone
    return Coordinate.invalid
}
    
//#-localizable-zone(localizableCommentsPart24ExamplePage)
// Checks each class of ship against the array of sunk ships to determine the shortest type of ship that hasn’t been sunk.
//#-end-localizable-zone
func getSmallestUnsunkShip() -> ShipClassification {
//#-localizable-zone(localizableCommentsPart25ExamplePage)
    // Loop through all classes of ship.
//#-end-localizable-zone
    for shipClass in ShipClassification.allCases {
//#-localizable-zone(localizableCommentsPart26ExamplePage)
        // Check for a sunk ship that matches the current ship class.
//#-end-localizable-zone
        var shipClassIsSunk = false
        for sunkShip in game.sunkShips {
            if sunkShip.classification == shipClass {
                shipClassIsSunk = true
            }
        }
        
//#-localizable-zone(localizableCommentsPart27ExamplePage)
        // If there isn’t a sunken ship of this class, return the class.
//#-end-localizable-zone
        if !shipClassIsSunk {
            return shipClass
        }
    }
    
//#-localizable-zone(localizableCommentsPart28ExamplePage)
    // Return the first class of ship.
//#-end-localizable-zone
    return ShipClassification.allCases[0]
}
    
//#-localizable-zone(localizableCommentsPart29ExamplePage)
// Returns the number of neighboring tiles in a given direction that are or could possibly be hits.
//#-end-localizable-zone
func possibleHitCountFrom(coordinate: Coordinate, inDirection direction: Direction) -> Int {
    var coordinateToCheck = coordinate
    var count = 0
    
    while true {
        let tile = grid.tileAt(coordinateToCheck)
        if tile.state != .unexplored && tile.state != .hit {
            break
        }
        
        count += 1
        coordinateToCheck = coordinateToCheck.neighbor(inDirection: direction)
    }
    
    return count
}

func startingColumnForRow(row: Int) -> Int {
    if row.isEven {
        return 0
    } else {
        return 1
    }
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

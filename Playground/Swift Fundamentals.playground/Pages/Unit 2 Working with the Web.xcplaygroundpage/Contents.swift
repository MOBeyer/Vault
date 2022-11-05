
/*
# Working With The Web

- ### Swift Lessons
- [[Closure]]s
- [[Extension]]s
- ### SDK Lessons
- Practical Animation
- Working with the Web: HTTP und URL Session
- Working with the Web: JSON
- Working with the Web: Concurrency

- ## Closures
- What you will Learn
- What a closure is
- How to define a closure
- How to pass a closure as a function argument
- How to use sorted(by:), map(), filter(), reduce()
- Vocabulary
- [[Capture]]
- [[Closure]]
- [[Filter]]
- [[Map]]
- [[Reduce]]
- [[Syntactic sugar]] 

#### Syntax
````swift
func sum(numbers: [Int] -> Int) {
    // Code that adds together the numbers array
    return total
}
````

````swift
let sumClosure = { (numbers: [Int]) -> Int in
    return total
}
let sum = sumClosure([1, 2, 3, 4])
print(sum)

1. A closure with no parameter and no return value:
````

#### Passing Closures into Arguments

````swift
let sortedTracks = tracks.sorted { (firstTrack, SecondTrack) -> Bool in
    return firstTrack.trackNumber < secondTrack.trackNumber
}
````
#### Additional Syntactic Sugar
```swift


```
 */


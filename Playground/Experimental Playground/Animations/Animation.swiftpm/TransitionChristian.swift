//
//  File.swift
//  My App
//
//  Created by Moritz Beyer on 16.02.22.
//
/*
import Foundation

import SwiftUI

extension BidirectionalCollection where Element: Equatable {
    func element(after current: Element) -> Element {
        guard
            let currentIndex = firstIndex(of: current)
        else { return current }

        let nextIndex = index(after: currentIndex)

        return nextIndex < endIndex ? self[nextIndex] : current
    }

    func element(before current: Element) -> Element {
        guard
            let currentIndex = firstIndex(of: current)
        else { return current }

        let previousIndex = index(before: currentIndex)

        return previousIndex >= startIndex ? self[previousIndex] : current
    }
}

enum Step: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5

    func next() -> Step {
        Self.allCases.element(after: self)
    }

    func previous() -> Step {
        Self.allCases.element(before: self)
    }
}

struct FlipView: View {

    @State var current: Step = .one
    @State var direction: Direction = .center

    var body: some View {
        Flashcard(front: {
            view(for: current)
        }, back: {
            targetView()
        }, completion: {
            current = direction == .next ? current.next() : current.previous()
        },
                  direction: $direction)

        Button("next") {
            direction = .next
        }
        Button("previous") {
            direction = .previous
        }
    }

    @ViewBuilder func targetView() -> some View {
        switch direction {
        case .next:
            view(for: current.next())
        case .previous:
            view(for: current.previous())
        case .center:
            view(for: current)
        }
    }

    @ViewBuilder func view(for step: Step) -> some View {
        switch step {
        case .one:
            Text("\(step.rawValue)")
        case .two:
            Text("\(step.rawValue)")
        case .three:
            Text("\(step.rawValue)")
        case .four:
            Text("\(step.rawValue)")
        case .five:
            Text("\(step.rawValue)")
        }
    }
}

enum Direction {
    case next
    case center
    case previous
}

struct Flashcard<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    var completion: () -> Void

    @Binding var direction: Direction
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    init(@ViewBuilder front: @escaping () -> Front,
         @ViewBuilder back: @escaping () -> Back,
         completion: @escaping () -> Void,
         direction: Binding<Direction> ) {
        self.front = front
        self.back = back
        self.completion = completion
        _direction = direction
    }
    
    var body: some View {
        ZStack {
            back()
                .background(Color.white)
                .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))

            front()
                .background(Color.white)
                .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        }
        .padding()
        .frame(height: 200)
        .frame(maxWidth: .infinity)

        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
        )
        .padding()
        .onChange(of: direction,
                  perform: { change in
            flipFlashcard(direction: change)
        })
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
        .onAnimationCompleted(for: contentRotation) {
            completion()
            flashcardRotation = 0.0
            contentRotation = 0.0
            direction = .center
        }
    }
    
    func flipFlashcard(direction: Direction) {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            switch direction {
            case .next:
                flashcardRotation += 180
            case .center:
                break
            case .previous:
                flashcardRotation -= 180
            }
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            switch direction {
            case .next:
                contentRotation += 180
            case .center:
                break
            case .previous:
                contentRotation -= 180
            }
        }
    }
}

struct FliView_Previews: PreviewProvider {
    static var previews: some View {
        FlipView()
    }
}


public extension View {

    /// Calls the completion handler whenever an animation on the given value completes.
    /// - Parameters:
    ///   - value: The value to observe for animations.
    ///   - completion: The completion callback to call once the animation completes.
    /// - Returns: A modified `View` instance with the observer attached.
    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
}


/// Copied from: https://www.avanderlee.com/swiftui/withanimation-completion-callback/
/// An animatable modifier that is used for observing animations for a given animatable value.
public struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {

    /// While animating, SwiftUI changes the old input value to the new target value using this property. This value is set to the old value until the animation completes.
    public var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }

    /// The target value for which we're observing. This value is directly set once the animation starts. During animation, `animatableData` will hold the oldValue and is only updated to the target value once the animation completes.
    private var targetValue: Value

    /// The completion callback which is called once the animation completes.
    private var completion: () -> Void

    init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }

    /// Verifies whether the current animation is finished and calls the completion callback if true.
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }

        /// Dispatching is needed to take the next runloop for the completion callback.
        /// This prevents errors like "Modifying state during view update, this will cause undefined behavior."
        DispatchQueue.main.async {
            self.completion()
        }
    }

    public func body(content: Content) -> some View {
        /// We're not really modifying the view so we can directly return the original input value.
        return content
    }
}
*/

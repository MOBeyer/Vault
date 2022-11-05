
import PlaygroundSupport
import UIKit
import Cutscenes

let item = SPCCutSceneItem(
    name: "Event Handlers",
    sourcePath: "eventHandlers/eventHandlers.html",
    timeline: [
        (name: "Main Timeline", seconds: 0.0),
        (name: "Main Timeline", seconds: 5.1),
        (name: "Main Timeline", seconds: 17.5),
        (name: "Main Timeline", seconds: 21.1),
        (name: "Main Timeline", seconds: 25.13),
        (name: "Main Timeline", seconds: 27.8),
        (name: "Main Timeline", seconds: 33.7)]
)

PlaygroundPage.current.liveView = SPCHypeCutSceneController.makeFromStoryboard(for: item)

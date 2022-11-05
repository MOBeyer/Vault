
import PlaygroundSupport
import UIKit
import Cutscenes

let item = SPCCutSceneItem(
    name: "Coordinates",
    sourcePath: "coordinates/coordinates.html",
    timeline: [
        (name: "Main Timeline", seconds: 0.0),
        (name: "Main Timeline", seconds: 3.8),
        (name: "Main Timeline", seconds: 8.13),
        (name: "Main Timeline", seconds: 18.8),
        (name: "Main Timeline", seconds: 24.07),
        (name: "Main Timeline", seconds: 30.83),
        (name: "Main Timeline", seconds: 34.27)]
)

PlaygroundPage.current.liveView = SPCHypeCutSceneController.makeFromStoryboard(for: item)

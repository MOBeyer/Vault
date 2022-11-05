
import PlaygroundSupport
import UIKit
import Cutscenes

let item = SPCCutSceneItem(
    name: "Touch Events",
    sourcePath: "touchEvents/touchEvents.html",
    timeline: [
        (name: "Main Timeline", seconds: 0.0),
        (name: "Main Timeline", seconds: 5.1),
        (name: "Main Timeline", seconds: 6.5),
        (name: "Main Timeline", seconds: 13.47),
        (name: "Main Timeline", seconds: 15.4),
        (name: "Main Timeline", seconds: 22.1),
        (name: "Main Timeline", seconds: 24.17)]
)

PlaygroundPage.current.liveView = SPCHypeCutSceneController.makeFromStoryboard(for: item)

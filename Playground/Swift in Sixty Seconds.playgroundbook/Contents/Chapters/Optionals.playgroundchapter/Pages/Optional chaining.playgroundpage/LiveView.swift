import PlaygroundSupport
import UIKit

let liveView = LiveViewController()
liveView.videoURL = #fileLiteral(resourceName: "10-7.mp4")
PlaygroundPage.current.liveView = liveView


import UIKit

var str = "Hello, playground"
/*:
Project 13, part one
We’re back to our regular schedule today, starting with another all-new app called Instafilter. You’re going to meet an important UIKit component called UISlider, but more importantly you’ll learn how Core Image lets us create real-time image effects.

As you’ll see, Core Image is one of the most advanced frameworks available on iOS, letting us create all sorts of powerful image effects with only a handful of lines of code. However, it’s also slow in the simulator – while you can try it out there, if possible I would recommend running your code on a real device. Even an old iPhone is likely to perform better than the simulator running on the very latest Macs.

As we embark on the next series of app projects, you’ll see the things we cover start to change a little: we look at more advanced components, and we look at a few niche components too. Although these are much less commonly used than things like UITableViewController, I include them in the course because they form part of a the larger puzzle of iOS development.

As you progress, what you’ll find is that it’s rare you’ll have an app idea that is totally covered by one of my projects here. Instead, you’ll want a piece of project 9, a piece of project 3, a piece of project 18, and some new work of your own. So, by broadening your horizons with things like MapKit, notifications, and iBeacons, I’m giving you the long-term knowledge to help your own app dreams come true in the future.

Yes, I know it’s tempting to wander off and try something else instead, but stick with me. As Alexa Hirschfeld said, “the biggest challenge is to stay focused – to have the discipline when there are so many competing things.”

Today you have three topics to work through, and you’ll learn about UISlider while also getting some practice with UIImagePickerController, and more.
 
 In project 10 you learned how to use UIImagePickerController to select and import a picture from your user's photo library. In this project, we're going to add the reverse: writing images back to the photo library. But because you're here to learn as much as possible, I'm also going to introduce you to another UIKit component, UISlider, and also a little bit of Core Image, which is Apple's high-speed image manipulation toolkit.
 
 The project we're going to make will let users choose a picture from their photos, then manipulate it with a series of Core Image filters. Once they are happy, they can save the processed image back to their photo library.
 
 To get started, create a new Single View App project in Xcode and name it Project13
*/

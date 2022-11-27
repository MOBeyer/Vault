//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

Pictures bring any user interface to life, but as app designers it’s our job to frame those pictures with a smart user interface to really bring them to life. As Ben Shneiderman, a professor for Computer Science at the University of Maryland, once said, “a picture is worth a thousand words; an interface is worth a thousand pictures” – for me that really underscores the importance of getting both right!

Today you’re going to be trying Core Image for the first time. Its API has never really been updated for Swift, so you’ll see a few quirks here and there. It also has precious little margin for error, so you’ll see we add various checks to make sure our code is safe at runtime – it’s better to be safe than sorry.

I said it before, but it bears repeating here: Core Image is extraordinarily fast on real iOS devices, but extraordinarily slow in Xcode’s simulator. So, don’t worry if you find the blur effect appears to lock up your Mac while it works – it will happen in the blink of an eye on a real device.

Today you have three topics to work through, and you’ll learn about CIContext, CIFilter, and more.

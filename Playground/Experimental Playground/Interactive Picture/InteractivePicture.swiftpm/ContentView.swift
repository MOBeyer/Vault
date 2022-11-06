import SwiftUI

struct ContentView: View {
    
    @State private var isShow = false
    @State private var pass = 0
    @State private var imageWidth : CGFloat = 100
    @State private var imageHeight : CGFloat = 100
    @State private var macAnimate : Bool = true
    @State private var vanGogh = false
    @State private var banana = false
    @State private var finalyText : String = ""
    
    var body : some View{
        
        ZStack{
            
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                    .gesture(TapGesture()
                                .onEnded({ (_) in
                        withAnimation {
                            self.pass += 1
                            switch self.pass {
                            case 1:
                                self.imageHeight = 350
                                self.imageWidth = 350
                            case 2 :
                                self.imageHeight = 100
                                self.imageWidth = 100
                            case 3:
                                self.imageHeight = 350
                                self.imageWidth = 350
                            case 4 :
                                self.imageHeight = 100
                                self.imageWidth = 100
                                self.macAnimate.toggle()
                            default:
                                break
                            }
                            
                        }
                    }))
                
                if pass <= 6 {
                    Image(uiImage :UIImage(named: "skipButton")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .position(x: 600, y: 440)
                    
                }
                
                HStack{
                    if pass == 0{
                        ZStack{
                            Text("Hi , My name is Alkan.")
                                .foregroundColor(Color.white.opacity(0.4))
                                .font(.system(size: 40))
                            
                            Text("Hi , My name is Alkan.")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .mask(
                                    Capsule()
                                        .fill(LinearGradient(gradient: .init(colors: [.clear,.white,.clear]), startPoint: .top, endPoint: .bottom))
                                        .rotationEffect(.init(degrees: 30))
                                        .offset(x: self.isShow ? 180 : -130)
                                )
                        }
                    }
                    
                    if pass <= 4 {
                        HStack{
                            ZStack{
                                HStack{
                                    Image(uiImage :UIImage(named: "Alkan")!)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: imageWidth, height: imageHeight)
                                    if pass == 2 {
                                        ZStack{
                                            Text("Welcome to My Swift Student Challenge Project.🎉")
                                                .foregroundColor(Color.white.opacity(0.4))
                                                .font(.system(size: 40))
                                            
                                            Text("Welcome to My Swift Student Challenge Project.🎉")
                                                .foregroundColor(.white)
                                                .font(.system(size: 40))
                                                .mask(
                                                    Capsule()
                                                        .fill(LinearGradient(gradient: .init(colors: [.clear,.white,.clear]), startPoint: .top, endPoint: .bottom))
                                                        .rotationEffect(.init(degrees: 30))
                                                        .offset(x: self.isShow ? 180 : -130)
                                                )
                                        }.onAppear {
                                            
                                            withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: true)){
                                                
                                                self.isShow.toggle()
                                            }
                                        }
                                    }
                                    
                                }
                                if pass == 3 || pass == 4{
                                    Image(uiImage :UIImage(named: "mac")!)
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: -3 , y: macAnimate ? 110 : 40)
                                        .frame(width: macAnimate ? 261 : 73, height:  macAnimate ? 176 : 50)
                                    
                                }
                            }
                            if pass == 4 {
                                ZStack{
                                    Text("All the last days were like ...👨‍💻")
                                        .foregroundColor(Color.white.opacity(0.4))
                                        .font(.system(size: 40))
                                    
                                    Text("All the last days were like ...👨‍💻")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40))
                                        .mask(
                                            Capsule()
                                                .fill(LinearGradient(gradient: .init(colors: [.clear,.white,.clear]), startPoint: .top, endPoint: .bottom))
                                                .rotationEffect(.init(degrees: 30))
                                                .offset(x: self.isShow ? 180 : -130)
                                        )
                                }.onAppear {
                                    
                                    withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: true)){
                                        
                                        self.isShow.toggle()
                                    }
                                }
                            }
                        }}
                }
            }
            .onAppear {
                
                withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: true)){
                    
                    self.isShow.toggle()
                }
            }
            
            
            if pass == 5{
                VStack{
                    HStack{
                        Image(uiImage :UIImage(named: "helloSticker")!)
                        Spacer()
                        Image(uiImage :UIImage(named: "wwdcSticker")!)
                    }.padding()
                    HStack{
                        Text("What's in this playground?")
                            .font(.system(size : 40))
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        
                    }.padding()
                    Text("I have been transferring the pictures to the virtual environment and making them interactive. While I was thinking \"What can I do as Swift Student Challenge Project\",  I suddenly decided to turn my hobby into my project! 🤩")
                        .foregroundColor(.white).italic()
                        .font(.system(size : 20))
                }.padding()
            }
            if pass == 6 {
                VStack{
                    HStack{
                        Text("Some of the Pictures ;")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    }.padding(30)
                    Spacer()
                    HStack{
                        VStack{
                            Image(uiImage :UIImage(named: "vanGogh")!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 210, height: 140)
                            Text("Van Gogh Dark Mode")
                                .foregroundColor(Color.white)
                                .bold()
                        }.padding()
                            .gesture(TapGesture().onEnded({ (_) in
                                self.vanGogh = true
                            })).sheet(isPresented: $vanGogh){
                                DarkModeGogh()
                            }
                        
                        VStack{
                            Image(uiImage :UIImage(named: "banana")!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 210, height: 140)
                            Text("Sign In With Apple")
                                .foregroundColor(Color.white)
                                .bold()
                        }.padding()
                            .gesture(TapGesture().onEnded({ (_) in
                                self.banana = true
                            })).sheet(isPresented: $banana){
                                SignInWithApple()
                            }}
                    Spacer()
                    Text("Click images to see interactive table")
                        .italic()
                        .foregroundColor(Color.white)
                        .padding()
                }
            }
            if pass == 7 {
                VStack{
                    Text("And Now")
                        .font(.system(size: 29))
                        .bold()
                        .foregroundColor(.white)
                    Text(finalyText)
                        .font(.system(size: 29))
                        .bold()
                        .foregroundColor(.white)
                }.padding()
                    .onAppear {
                        withAnimation {
                            self.finalyText = "You can create your own picture !!🥳"
                        }
                        
                    }
            }
        }
    }
}


struct DarkModeGogh  : View {
    @State private var darkMode = false
    var body: some View{
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(uiImage :UIImage(named: "\(darkMode ? "vanGoghDark"  :"vanGogh")")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 230)
                    .padding()
                
                
                Toggle(isOn: $darkMode ){
                    Text("0")
                }
                .labelsHidden()
                Text("Dark Mode : \(darkMode ? "On" : "Off" )")
                    .foregroundColor(Color.white)
                    .bold()
            }}
    }
}
struct SignInWithApple  : View{
    @State private var isApporove = false
    @State private var price = "120.000"
    var body: some View{
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image(uiImage :UIImage(named: "\(isApporove ? "apple"  :"banana")")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 230)
                    .padding()
                if isApporove == false {
                    Image(uiImage :UIImage(named: ("signInWithApple"))!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 330, height: 70)
                        .gesture(TapGesture().onEnded({ (_) in
                            withAnimation {
                                self.isApporove.toggle()
                            }
                            
                        }
                                                     )
                        )
                    
                }else{
                    
                    Approve()
                }
                
                
            }
            
        }
    }
}
struct Approve: View {
    
    @State private var spinArrow = false   // Spinning Motion
    @State private var dismissArrow = false   // Opacity 1 - 0
    @State private var displayBorder = false   // StrokeBorder (lineWidth) 64 - 5
    @State private var displayCheckmark = false  // Trimpath from 1 - 0
    
    let aqua = Color(red: 0.0, green: 150/255, blue: 1.0)
    let ice = Color(red: 115/255, green: 253/255, blue: 1.0)
    var body: some View {
        ZStack {
            
            //
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: displayBorder ? 5 : 64))
                .frame(width: 128, height: 128)
                .foregroundColor(aqua)
                //.animation(Animation.easeOut(duration: 3).speed(1.5))
                .onAppear() {
                    self.displayBorder.toggle()
                }
            
            Image(systemName: "arrow.2.circlepath")
                .font(.largeTitle)
                .foregroundColor(.white)
                .rotationEffect(.degrees(spinArrow ? 720 : -360))
                .opacity(dismissArrow ? 0 : 1)
                //.animation(Animation.easeInOut(duration: 2))
                .onAppear() {
                    self.spinArrow.toggle()
                    
                    withAnimation(Animation.easeInOut(duration: 1).delay(1)) {
                        self.dismissArrow.toggle()
                    }
                }
            
            Path { path in
                path.move(to: CGPoint(x: 20, y: -40))
                path.addLine(to: CGPoint(x: 20, y: -40))
                path.addLine(to: CGPoint(x: 40, y: -20))
                path.addLine(to: CGPoint(x: 80, y: -60))
                
            }.trim(from: 0, to: displayCheckmark ? 1 : 0)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(displayCheckmark ? ice : .white)
                .offset(x: 270, y: 130)
                //.animation(Animation.interpolatingSpring(stiffness: 160, damping: 20).delay(2))
                .onAppear() {
                    self.displayCheckmark.toggle()
                }
            
        }
        
    }
    
}

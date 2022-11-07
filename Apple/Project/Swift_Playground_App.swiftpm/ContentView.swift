import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
        }
    }
}

enum iPhonePreviewDevices: String, CaseIterable {
    case iPhoneX = "iPhone X"
    case iPhoneXs = "iPhone Xs"
    case iPhoneXsMax = "iPhone Xs Max"
    case iPhoneSE = "iPhone SE (3rd generation)"
    case iPhone14ProMax = "iPhone 14 Pro Max"
    case iPhone14Pro = "iPhone 14 Pro"
    case iPhone14Plus = "iPhone 14 Plus"
    case iPhone14 = "iPhone 14"

    static var all: [String] {
        return iPhonePreviewDevices.allCases.map { $0.rawValue }
    }
}

enum iPadPreviewDevices: String, CaseIterable {
    case iPad = "iPad (10th generation)"
    case iPadAir = "iPad Air (5th generation)"
    case iPadPro11inch = "iPad Pro (11-inch) (4th generation)"
    case iPadPro12inch = "iPad Pro (12.9-inch) (6th generation)"
    case iPadMini = "iPad mini (6th generation)"

    static var all: [String] {
        return iPadPreviewDevices.allCases.map { $0.rawValue }
    }
}

struct SampleView_Previews_MyDevices: PreviewProvider {
    static var previews: some View {
        ForEach(iPhonePreviewDevices.all, id: \.self) { devicesName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: devicesName))
                .previewDisplayName(devicesName)
        }
    
        ForEach(iPadPreviewDevices.all, id: \.self) { devicesName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: devicesName))
                .previewDisplayName(devicesName)
        }
    }
}

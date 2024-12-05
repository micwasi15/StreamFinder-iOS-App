import SwiftUI

extension Image {
    static func fromFolder(named name: String, folder: String) -> Image? {
        if let path = Bundle.main.path(forResource: "\(name)", ofType: "png"),
           let uiImage = UIImage(contentsOfFile: path) {
            return Image(uiImage: uiImage)
        }
        return nil
    }

    static func fromLogosFolder(named name: String) -> Image? {
        return fromFolder(named: name, folder: "logos")
    }

    static func fromFlagsFolder(named name: String) -> Image? {
        return fromFolder(named: name, folder: "flags")
    }

    static func fromIconsFolder(named name: String) -> Image? {
        return fromFolder(named: name, folder: "icons")
    }
}

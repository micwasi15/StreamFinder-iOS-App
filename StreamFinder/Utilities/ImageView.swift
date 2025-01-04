import SwiftUI

extension Image {
    static func fromFolder(named name: String) -> Image? {
        if let path = Bundle.main.path(forResource: "\(name)", ofType: "png"),
           let uiImage = UIImage(contentsOfFile: path) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
}

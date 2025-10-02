import SwiftUI

// MARK: - AppImage

enum AppImage: String {
  case infonavit = "img-infonavit"
  case people = "img-people"
  case socioInfonavit = "img-socio-infonavit"
}

// MARK: - Image+App

extension Image {
  static func app(_ image: AppImage) -> Image {
    return Image(image.rawValue)
  }
}

// MARK: - UIImage+App

extension UIImage {
  static func app(_ image: AppImage) -> UIImage {
    return UIImage(named: image.rawValue)!
  }
}

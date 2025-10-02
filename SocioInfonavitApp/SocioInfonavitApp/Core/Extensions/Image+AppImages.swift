//
//  Image+AppImages.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

enum AppImage: String {
  case infonavit = "img-infonavit"
  case people = "img-people"
  case socioInfonavit = "img-socio-infonavit"
}

extension Image {
  static func app(_ image: AppImage) -> Image {
    return Image(image.rawValue)
  }
}

extension UIImage {
  static func app(_ image: AppImage) -> UIImage {
    return UIImage(named: image.rawValue)!
  }
}

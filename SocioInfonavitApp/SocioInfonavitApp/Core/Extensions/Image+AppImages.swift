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
    // MARK: - Factory

    static func app(_ image: AppImage) -> Image {
        Image(image.rawValue)
    }
}

extension UIImage {
    // MARK: - Factory

    static func app(_ image: AppImage) -> UIImage {
        UIImage(named: image.rawValue) ?? UIImage()
    }
}

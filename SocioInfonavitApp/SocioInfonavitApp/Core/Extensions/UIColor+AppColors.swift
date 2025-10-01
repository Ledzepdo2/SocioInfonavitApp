//
//  UIColor+AppColors.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

enum AppColor: String {
    case redPrimary = "RedPrimary"
    case graySecondary = "GraySecondary"
    case backgroundPrimary = "BackgroundLight"
    case backgroundSecondary = "BackgroundDark"
    case shimmerStart = "ShimmerStart"
    case shimmerEnd = "ShimmerEnd"
}

extension UIColor {
    static func app(_ color: AppColor) -> UIColor {
        return UIColor(named: color.rawValue)!
    }
}

extension Color {
    static func app(_ color: AppColor) -> Color {
        return Color(color.rawValue)
    }
}

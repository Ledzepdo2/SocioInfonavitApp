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
    case backgroundPrimary = "BackgroundPrimary"
    case backgroundSecondary = "BackgroundSecondary"
    case shimmerStart = "ShimmerStart"
    case shimmerEnd = "ShimmerEnd"
}

extension UIColor {
    // MARK: - Factory

    static func app(_ color: AppColor) -> UIColor {
        UIColor(named: color.rawValue) ?? .clear
    }
}

extension Color {
    // MARK: - Factory

    static func app(_ color: AppColor) -> Color {
        Color(color.rawValue, bundle: .main)
    }
}

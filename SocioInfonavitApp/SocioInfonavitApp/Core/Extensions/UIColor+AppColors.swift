import SwiftUI

// MARK: - AppColor

enum AppColor: String {
  case redPrimary = "RedPrimary"
  case graySecondary = "GraySecondary"
  case backgroundPrimary = "BackgroundPrimary"
  case backgroundSecondary = "BackgroundSecondary"
  case shimmerStart = "ShimmerStart"
  case shimmerEnd = "ShimmerEnd"
}

// MARK: - UIColor+App

extension UIColor {
  static func app(_ color: AppColor) -> UIColor {
    UIColor(named: color.rawValue) ?? .clear
  }
}

// MARK: - Color+App

extension Color {
  static func app(_ color: AppColor) -> Color {
    Color(color.rawValue, bundle: .main)
  }
}

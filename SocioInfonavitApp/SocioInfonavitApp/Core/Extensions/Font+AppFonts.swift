import SwiftUI

// MARK: - AppFont

enum AppFont: String {
  case montserratRegular = "Montserrat-Regular"
  case montserratSemiBold = "Montserrat-SemiBold"
  case montserratBold = "Montserrat-Bold"
}

// MARK: - Font+App

extension Font {
  static func app(_ appFont: AppFont, size: CGFloat) -> Font {
    return Font.custom(appFont.rawValue, size: size)
  }
}

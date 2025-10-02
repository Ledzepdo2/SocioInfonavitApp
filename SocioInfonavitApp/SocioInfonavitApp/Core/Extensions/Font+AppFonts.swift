//
//  Font+AppFonts.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

enum AppFont: String {
  case montserratRegular = "Montserrat-Regular"
  case montserratSemiBold = "Montserrat-SemiBold"
  case montserratBold = "Montserrat-Bold"
}

extension Font {
  static func app(_ appFont: AppFont, size: CGFloat) -> Font {
    return Font.custom(appFont.rawValue, size: size)
  }
}

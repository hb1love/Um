//
//  UIFont+Um.swift
//  Common
//
//  Created by hb1love on 2020/01/30.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

public extension UIFont {
  private enum UmFont: String {
    case appleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
    case appleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
    case appleSDGothicNeoLight = "AppleSDGothicNeo-Light"
    case appleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
    case appleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
    case appleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
    case appleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
  }

  static func defaultFont(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
    var defaultFontName = UmFont.appleSDGothicNeoRegular
    switch weight {
    case .ultraLight:
        defaultFontName = .appleSDGothicNeoUltraLight
    case .thin:
        defaultFontName = .appleSDGothicNeoThin
    case .light:
        defaultFontName = .appleSDGothicNeoLight
    case .regular:
        defaultFontName = .appleSDGothicNeoRegular
    case .medium:
        defaultFontName = .appleSDGothicNeoMedium
    case .semibold:
        defaultFontName = .appleSDGothicNeoSemiBold
    case .bold, .heavy, .black:
        defaultFontName = .appleSDGothicNeoBold
    default:
        break
    }

    guard let font = UIFont(name: defaultFontName.rawValue, size: size) else {
      return .systemFont(ofSize: size)
    }
    return font
  }
}

//
//  Date+Extension.swift
//  SeasonsBase
//
//  Created by hb1love on 2019/11/25.
//  Copyright © 2019 seasons. All rights reserved.
//

import Foundation

public extension Date {
  func stringYYMMDD_HHmm() -> String {
    let formatter = DateFormatter.dateFormatterOfyyMMdd_HHmm()
    return formatter.string(from: self)
  }

  func stringYYYYMMDD_HHmm() -> String {
    let formatter = DateFormatter.dateFormatterOfyyyyMMdd_HHmm()
    return formatter.string(from: self)
  }

  func stringYYYYMMDD() -> String {
    let formatter = DateFormatter.dateFormatterOfyyyyMMdd()
    return formatter.string(from: self)
  }

  func stringMMddHHmm() -> String {
    let formatter = DateFormatter.dateFormatterOfMMdd_HHmm()
    return formatter.string(from: self)
  }

  func stringMMdd() -> String {
    let formatter = DateFormatter.dateFormatterOfMMdd()
    return formatter.string(from: self)
  }

  func stringHHmm() -> String {
    let formatter = DateFormatter.dateFormatterOfHHmm()
    return formatter.string(from: self)
  }
}

public extension DateFormatter {
  static func dateFormatterOfyyMMdd_HHmm() -> DateFormatter {
    struct Static {
      static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd HH:mm"
        formatter.calendar = Foundation.Calendar.gregorian
        return formatter
      }
    }
    return Static.dateFormatter
  }

  static func dateFormatterOfyyyyMMdd_HHmm() -> DateFormatter {
    struct Static {
      static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        formatter.calendar = Foundation.Calendar.gregorian
        return formatter
      }
    }
    return Static.dateFormatter
  }

  static func dateFormatterOfyyyyMMdd() -> DateFormatter {
    struct Static {
      static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        formatter.calendar = Foundation.Calendar.gregorian
        return formatter
      }
    }
    return Static.dateFormatter
  }

  static func dateFormatterOfMMdd_HHmm() -> DateFormatter {
    struct Static {
      static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd HH:mm"
        formatter.calendar = Foundation.Calendar.gregorian
        return formatter
      }
    }
    return Static.dateFormatter
  }

  static func dateFormatterOfMMdd() -> DateFormatter {
    struct Static {
      static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd"
        formatter.calendar = Foundation.Calendar.gregorian
        return formatter
      }
    }
    return Static.dateFormatter
  }

  static func dateFormatterOfHHmm() -> DateFormatter {
    struct Static {
      static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.calendar = Foundation.Calendar.gregorian
        return formatter
      }
    }
    return Static.dateFormatter
  }
}


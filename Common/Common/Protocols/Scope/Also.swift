//
//  Also.swift
//  Common
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

public protocol Also {}
public extension Also where Self: Any {

  ///  `also`
  ///
  ///  let org = Organazation().also {
  ///    $0.name = "podo"
  ///    $0.member = Member(name: "hb1love", role: .owner)
  ///  }
  @discardableResult
  func also(_ block: ((Self) -> Void)) -> Self {
    block(self)
    return self
  }
}

extension NSObject: Also {}

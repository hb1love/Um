//
//  Category.swift
//  Common
//
//  Created by hb1love on 2020/01/31.
//  Copyright © 2020 depromeet. All rights reserved.
//

public struct Category: Codable {
  public var name: String?
  public var skills: [Skill]?

  public static let mock = [
    Category(name: "디자인", skills: [.photoshop]),
    Category(name: "IT", skills: [.app]),
    Category(name: "언어", skills: [.english]),
    Category(name: "디자인", skills: [.illustration]),
    Category(name: "IT", skills: [.frontent]),
    Category(name: "IT", skills: [.ai])
  ]
}

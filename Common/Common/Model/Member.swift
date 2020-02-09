//
//  Member.swift
//  Common
//
//  Created by hb1love on 2020/01/31.
//  Copyright © 2020 depromeet. All rights reserved.
//

public struct Member: Codable {
  public var id: String?
  public var photoUrl: String?
  public var nickname: String?
  public var introduce: String?
  public var has: [Skill]?
  public var wanna: [Skill]?

  public static let mock = [
    Member(
      id: "1",
      photoUrl: "https://is.gd/yptK4j",
      nickname: "여신님",
      introduce: "안녕하세요. 재능 교환 언제든 환영합니다 :)",
      has: [.photoshop, .ai, .frontent, .photoshop, .ai, .frontent, .photoshop, .ai, .frontent, .photoshop, .ai, .frontent],
      wanna: [.app, .backend, .photoshop, .photoshop, .ai, .frontent, .photoshop, .ai, .frontent]
    ),
    Member(
      id: "2",
      photoUrl: "https://is.gd/tJ2RV8",
      nickname: "천재느님",
      introduce: "안녕하세요. 재능 교환 언제든 환영합니다 :)",
      has: [.frontent],
      wanna: [.app]
    ),
    Member(
      id: "3",
      photoUrl: "https://is.gd/MzV0QK",
      nickname: "아이유",
      introduce: "안녕하세요. 재능 교환 언제든 환영합니다 :)",
      has: [.app],
      wanna: [.backend]
    ),
    Member(
      id: "4",
      photoUrl: "https://is.gd/880xGD",
      nickname: "인공지능 박사",
      introduce: "안녕하세요. 재능 교환 언제든 환영합니다 :)",
      has: [.ai],
      wanna: [.photoshop]
    )
  ]
}

//
//  Post.swift
//  Common
//
//  Created by hb1love on 2020/01/31.
//  Copyright © 2020 depromeet. All rights reserved.
//

public struct Post: Codable {
  public var id: String?
  public var author: Member?
  public var title: String?
  public var has: [Skill]?
  public var wanna: [Skill]?
  public var area: String?
  public var description: String?

  public static let mock = [
    Post(
      id: "1",
      author: Member.mock.randomElement(),
      title: "웹개발 속성으로 알려주실분!",
      has: [.photoshop],
      wanna: [.frontent],
      area: "강남 어딘가",
      description: "재능 교환하실분 구해요!! 쪽지 연락주세요."
    ),
    Post(
      id: "2",
      author: Member.mock.randomElement(),
      title: "Kotlin, Spring 원해요 :3",
      has: [.app],
      wanna: [.backend],
      area: "성남 야탑",
      description: "능력자 나가신다 길을 비켜라 ~"
    ),
    Post(
      id: "3",
      author: Member.mock.randomElement(),
      title: "이 시국에 중국어 배우고 싶습니다.",
      has: [.english],
      wanna: [.chinese],
      area: "공덕? 협의 가능 ㅎ",
      description: "한국인이면 좋겠어요."
    )
  ]
}

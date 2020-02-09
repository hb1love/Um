//
//  MyPageViewSection.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxDataSources

enum MyPageViewSection {
  case profile([MyPageViewSectionItem])
  case introduce([MyPageViewSectionItem])
  case mySkills([MyPageViewSectionItem])
  case wannaSkills([MyPageViewSectionItem])

  static let initState: [MyPageViewSection]
    = [.profile([]),
       .introduce([]),
       .mySkills([]),
       .wannaSkills([])]
}

extension MyPageViewSection: SectionModelType {
  var items: [MyPageViewSectionItem] {
    switch self {
    case .profile(let items): return items
    case .introduce(let items): return items
    case .mySkills(let items): return items
    case .wannaSkills(let items): return items
    }
  }

  init(original: MyPageViewSection, items: [MyPageViewSectionItem]) {
    switch original {
    case .profile: self = .profile(items)
    case .introduce: self = .introduce(items)
    case .mySkills: self = .mySkills(items)
    case .wannaSkills: self = .wannaSkills(items)
    }
  }
}

enum MyPageViewSectionItem {
  case profile(ProfileCellReactor)
  case introduce(IntroduceCellReactor)
  case skill(SkillTagCellReactor)
}

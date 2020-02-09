//
//  SkillTagCellReactor.swift
//  Common
//
//  Created by hb1love on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import ReactorKit

public final class SkillTagCellReactor: Reactor {
  public typealias Action = NoAction

  public struct State {
    var name: String
  }

  public let initialState: State
  public let skill: Skill

  public init(skill: Skill) {
    self.initialState = State(name: skill.rawValue)
    self.skill = skill
  }
}

extension SkillTagCellReactor {
//  static func talentSectionItems(with members: [Member]) -> [TalentsCellSectionItem] {
//    members
//      .map(TalentCellReactor.init)
//      .map(TalentsCellSectionItem.talent)
//  }
}

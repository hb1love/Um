//
//  IntroduceCellReactor.swift
//  AccountUI
//
//  Created by NHNEnt on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ReactorKit

final class IntroduceCellReactor: Reactor {
  typealias Action = NoAction

  struct State {}

  let initialState: State

  init(member: Member) {
//    let sectionItems = type(of: self).talentSectionItems(with: members)
    self.initialState = State()
  }
}

extension IntroduceCellReactor {
//  static func talentSectionItems(with members: [Member]) -> [TalentsCellSectionItem] {
//    members
//      .map(TalentCellReactor.init)
//      .map(TalentsCellSectionItem.talent)
//  }
}

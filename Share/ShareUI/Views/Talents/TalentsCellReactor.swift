//
//  TalentsCellReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ReactorKit

final class TalentsCellReactor: Reactor {
  typealias Action = NoAction

  struct State {
    var sections: [TalentsCellSection] = [.talents([])]
  }

  let initialState: State

  init(members: [Member]) {
    let sectionItems = type(of: self).talentSectionItems(with: members)
    self.initialState = State(sections: [.talents(sectionItems)])
  }
}

extension TalentsCellReactor {
  static func talentSectionItems(with members: [Member]) -> [TalentsCellSectionItem] {
    members
      .map(TalentCellReactor.init)
      .map(TalentsCellSectionItem.talent)
  }
}

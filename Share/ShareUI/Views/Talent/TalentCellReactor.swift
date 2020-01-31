//
//  TalentCellReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService
import ReactorKit

final class TalentCellReactor: Reactor {
  typealias Action = NoAction

  struct State {}

  let initialState: State
  let member: Member

  init(member: Member) {
    self.initialState = State()
    self.member = member
  }
}

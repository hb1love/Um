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

  struct State {
    var introduce: String?
  }

  let initialState: State

  init(member: Member) {
    self.initialState = State(introduce: member.introduce)
  }
}

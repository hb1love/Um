//
//  ProfileCellReactor.swift
//  AccountUI
//
//  Created by NHNEnt on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ReactorKit

final class ProfileCellReactor: Reactor {
  typealias Action = NoAction

  struct State {
    var photoUrl: String?
    var nickname: String?
  }

  let initialState: State

  init(member: Member) {
    self.initialState = State(
      photoUrl: member.photoUrl,
      nickname: member.nickname
    )
  }
}

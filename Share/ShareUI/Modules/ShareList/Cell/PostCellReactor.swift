//
//  PostCellReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService
import ReactorKit

final class PostCellReactor: Reactor {
  typealias Action = NoAction

  struct State {}

  let initialState: State
  let post: Post

  init(post: Post) {
    self.initialState = State()
    self.post = post
  }
}

//
//  RecommendCategoryCellReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import struct Common.Category
import ShareService
import ReactorKit

final class RecommendCategoryCellReactor: Reactor {
  typealias Action = NoAction

  struct State {}

  let initialState: State
  let category: Category

  init(category: Category) {
    self.initialState = State()
    self.category = category
  }
}

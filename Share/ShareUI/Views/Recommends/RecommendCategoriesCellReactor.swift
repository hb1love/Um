//
//  RecommendCategoriesCellReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import struct Common.Category
import ReactorKit

final class RecommendCategoriesCellReactor: Reactor {
  typealias Action = NoAction

  struct State {
    var sections: [RecommendCategoriesCellSection] = [.categories([])]
  }

  let initialState: State

  init(categories: [Category]) {
    let sectionItems = type(of: self).categorySectionItems(with: categories)
    self.initialState = State(sections: [.categories(sectionItems)])
  }
}

extension RecommendCategoriesCellReactor {
  static func categorySectionItems(with categories: [Category]) -> [RecommendCategoriesCellSectionItem] {
    categories
      .map(RecommendCategoryCellReactor.init)
      .map(RecommendCategoriesCellSectionItem.category)
  }
}

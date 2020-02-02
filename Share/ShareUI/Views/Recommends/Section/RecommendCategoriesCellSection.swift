//
//  RecommendCategoriesCellSection.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/01.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxDataSources

enum RecommendCategoriesCellSection {
  case categories([RecommendCategoriesCellSectionItem])
}

extension RecommendCategoriesCellSection: SectionModelType {
  var items: [RecommendCategoriesCellSectionItem] {
    switch self {
    case .categories(let items): return items
    }
  }

  init(original: RecommendCategoriesCellSection, items: [RecommendCategoriesCellSectionItem]) {
    switch original {
    case .categories: self = .categories(items)
    }
  }
}

enum RecommendCategoriesCellSectionItem {
  case category(RecommendCategoryCellReactor)
}

//
//  BrowsingViewSection.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/08.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxDataSources

enum BrowsingViewSection {
  case categories([BrowsingViewSectionItem])
}

extension BrowsingViewSection: SectionModelType {
  var items: [BrowsingViewSectionItem] {
    switch self {
    case .categories(let items): return items
    }
  }

  init(original: BrowsingViewSection, items: [BrowsingViewSectionItem]) {
    switch original {
    case .categories: self = .categories(items)
    }
  }
}

enum BrowsingViewSectionItem {
  case category(CategoryCellReactor)
}

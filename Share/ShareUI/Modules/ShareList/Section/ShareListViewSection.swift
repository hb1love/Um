//
//  ShareListViewSection.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxDataSources

enum ShareListViewSection {
  case hotTalents([ShareListViewSectionItem])
  case recommendCategories([ShareListViewSectionItem])
  case hotPosts([ShareListViewSectionItem])
}

extension ShareListViewSection: SectionModelType {
  var items: [ShareListViewSectionItem] {
    switch self {
    case .hotTalents(let items): return items
    case .recommendCategories(let items): return items
    case .hotPosts(let items): return items
    }
  }

  init(original: ShareListViewSection, items: [ShareListViewSectionItem]) {
    switch original {
    case .hotTalents: self = .hotTalents(items)
    case .recommendCategories: self = .recommendCategories(items)
    case .hotPosts: self = .hotPosts(items)
    }
  }
}

enum ShareListViewSectionItem {
  case hotTalents(TalentsCellReactor)
  case recommendCategories(RecommendCategoriesCellReactor)
  case post(PostCellReactor)
}

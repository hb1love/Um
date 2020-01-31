//
//  TalentsCellSection.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/31.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxDataSources

enum TalentsCellSection {
  case talents([TalentsCellSectionItem])
}

extension TalentsCellSection: SectionModelType {
  var items: [TalentsCellSectionItem] {
    switch self {
    case .talents(let items): return items
    }
  }

  init(original: TalentsCellSection, items: [TalentsCellSectionItem]) {
    switch original {
    case .talents: self = .talents(items)
    }
  }
}

enum TalentsCellSectionItem {
  case talent(TalentCellReactor)
}

//
//  ShareDataSource.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

public protocol ShareDataSource {
  func getFeeds() -> Single<[Post]>
}

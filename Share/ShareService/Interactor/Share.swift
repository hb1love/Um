//
//  Share.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public protocol Share {
  func feeds() -> Single<[Post]>
}

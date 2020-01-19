//
//  ShareService.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public protocol ShareUseCase {
  func feeds() -> Single<[Post]>
}

public final class ShareService: ShareUseCase {

  private let share: Share

  public init(share: Share) {
    self.share = share
  }

  public func feeds() -> Single<[Post]> {
    share.feeds()
  }
}

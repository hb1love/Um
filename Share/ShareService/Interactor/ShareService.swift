//
//  ShareService.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import struct Common.Category
import RxSwift

public protocol ShareUseCase {
  func hotPosts() -> Single<[Post]>
  func recommendCategories() -> Single<[Category]>
}

public final class ShareService: ShareUseCase {

  private let share: Share

  public init(share: Share) {
    self.share = share
  }

  public func hotPosts() -> Single<[Post]> {
    .just(Post.mock.shuffled() + Post.mock.shuffled() + Post.mock.shuffled() + Post.mock.shuffled())
  }

  public func recommendCategories() -> Single<[Category]> {
    .just(Category.mock)
  }
}

//
//  UserService.swift
//  UserService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import RxSwift

public protocol UserUseCase {
  var currentUser: Observable<User?> { get }

  func fetchMe() -> Single<Void>
}

public final class UserService: UserUseCase {
  private let userRepository: UserRepositoryType

  public init(userRepository: UserRepositoryType) {
    self.userRepository = userRepository
  }

  private let userSubject = ReplaySubject<User?>.create(bufferSize: 1)
  public lazy var currentUser: Observable<User?> = self.userSubject.asObservable()
    .startWith(nil)
    .share(replay: 1)

  public func fetchMe() -> Single<Void> {
    userRepository.me()
      .do(onSuccess: { [weak self] user in
        self?.userSubject.onNext(user)
      })
      .map { _ in }
  }
}

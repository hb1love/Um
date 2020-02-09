//
//  UserService.swift
//  UserService
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import RxSwift

public protocol UserUseCase {
  var currentMember: Observable<Member?> { get }

  func fetchMe() -> Single<Void>
  func hotTalents() -> Single<[Member]>
}

public final class UserService: UserUseCase {
  private let userRepository: UserRepositoryType

  public init(userRepository: UserRepositoryType) {
    self.userRepository = userRepository
  }

  private let memberSubject = ReplaySubject<Member?>.create(bufferSize: 1)
  public lazy var currentMember: Observable<Member?> = self.memberSubject.asObservable()
    .startWith(nil)
    .share(replay: 1)

  public func fetchMe() -> Single<Void> {
    self.memberSubject.onNext(Member.mock.first)
    return .just(())
//    userRepository.me()
//      .do(onSuccess: { [weak self] user in
//        self?.memberSubject.onNext(user)
//      })
//      .map { _ in }
  }

  public func hotTalents() -> Single<[Member]> {
    .just(Member.mock.shuffled() + Member.mock.shuffled() + Member.mock.shuffled())
  }
}

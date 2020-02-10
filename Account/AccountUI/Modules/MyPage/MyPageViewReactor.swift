//
//  MyPageViewReactor.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import AuthService
import UserService
import ReactorKit
import RxSwift

public final class MyPageViewReactor: Reactor {
  public enum Action {
    case refresh
  }

  public enum Mutation {
    case setMember(Member?)
  }

  public struct State {
    var sections: [MyPageViewSection] = MyPageViewSection.initState
  }

  public let initialState: State
  private let authUseCase: AuthUseCase
  private let userUseCase: UserUseCase

  public init(authUseCase: AuthUseCase, userUseCase: UserUseCase) {
    self.initialState = State()
    self.authUseCase = authUseCase
    self.userUseCase = userUseCase
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refresh:
      let fetchMe = userUseCase.currentMember
        .map(Mutation.setMember)
      return fetchMe
    }
  }

  public func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .setMember(let member):
      guard let member = member else {
        return state
      }
      let profileSectionItem = self.profileSectionItems(with: member)
      let introduceSectionItem = self.introduceSectionItems(with: member)
      let mySkillsSectionItems = self.mySkillsSectionItems(with: member)
      let wannaSkillsSectionItems = self.wannaSkillsSectionItems(with: member)

      state.sections = [
        .profile(profileSectionItem),
        .introduce(introduceSectionItem),
        .mySkills(mySkillsSectionItems),
        .wannaSkills(wannaSkillsSectionItems)
      ]
      return state
    }
  }

  private func profileSectionItems(with member: Member) -> [MyPageViewSectionItem] {
    [MyPageViewSectionItem.profile(ProfileCellReactor(member: member))]
  }

  private func introduceSectionItems(with member: Member) -> [MyPageViewSectionItem] {
    [MyPageViewSectionItem.introduce(IntroduceCellReactor(member: member))]
  }

  private func mySkillsSectionItems(with member: Member) -> [MyPageViewSectionItem] {
    (member.has ?? [])
      .map(SkillTagCellReactor.init)
      .map(MyPageViewSectionItem.skill)
  }

  private func wannaSkillsSectionItems(with member: Member) -> [MyPageViewSectionItem] {
    (member.wanna ?? [])
      .map(SkillTagCellReactor.init)
      .map(MyPageViewSectionItem.skill)
  }
}

//
//  ShareListViewReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import ShareService
import UserService
import RxSwift
import ReactorKit

public final class ShareListViewReactor: Reactor {
  public enum Action {
    case refresh
    case loadMore
  }

  public enum Mutation {
    case setRefreshing(Bool)
    case setFeeds([Member], [Post])
    case appendFeeds([Post])
  }

  public struct State {
    var isRefreshing: Bool = false
    var sections: [ShareListViewSection] = [.hotTalents([])]
  }

  public let initialState: State
  private let shareUseCase: ShareUseCase
  private let userUseCase: UserUseCase

  public init(shareUseCase: ShareUseCase, userUseCase: UserUseCase) {
    self.initialState = State()
    self.shareUseCase = shareUseCase
    self.userUseCase = userUseCase
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refresh:
      guard !self.currentState.isRefreshing else { return .empty() }
      let startRefreshing = Observable<Mutation>.just(.setRefreshing(true))
      let endRefreshing = Observable<Mutation>.just(.setRefreshing(false))
      let setFeed = Observable
        .zip(userUseCase.hotTalents().asObservable(),
             shareUseCase.hotPosts().asObservable())
        .map(Mutation.setFeeds)

      return .concat([startRefreshing, setFeed, endRefreshing])

    case .loadMore:
      guard !self.currentState.isRefreshing else { return .empty() }
      let appendPosts = shareUseCase.hotPosts()
      .asObservable()
      .map(Mutation.appendFeeds)

      return .concat([appendPosts])
    }
  }

  public func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
      case .setRefreshing(let isRefreshing):
        let isEmpty = state.sections.first?.items.isEmpty == true
        state.isRefreshing = isRefreshing && !isEmpty
        return state

//      case let .setLoading(isLoading):
//        state.isLoading = isLoading
//        return state

      case .setFeeds(let talents, let posts):
        let talentsSectionItems = self.talentsSectionItems(with: talents)
        let postSectionItems = self.postSectionItems(with: posts)
        state.sections = [.hotTalents(talentsSectionItems), .recommendCategories([]), .hotPosts(postSectionItems)]
        return state

      case .appendFeeds(let posts):
        let sectionItems = state.sections[0].items + self.postSectionItems(with: posts)
        state.sections = [.hotPosts(sectionItems)]
        return state
    }
  }

  private func talentsSectionItems(with members: [Member]) -> [ShareListViewSectionItem] {
    [.hotTalents(TalentsCellReactor(members: members))]
  }

  private func postSectionItems(with posts: [Post]) -> [ShareListViewSectionItem] {
    posts
      .map(PostCellReactor.init)
      .map(ShareListViewSectionItem.post)
  }
}

//
//  BrowsingViewReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/08.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Common
import struct Common.Category
import ShareService
import RxSwift
import ReactorKit

public final class BrowsingViewReactor: Reactor {
  public enum Action {
    case newCategories([Category])
  }

  public enum Mutation {
    case updateCategories([Category])
  }

  public struct State {
    var sections: [BrowsingViewSection] = [.categories([])]
  }

  public let initialState: State
  private let shareUseCase: ShareUseCase

  public init(shareUseCase: ShareUseCase) {
    self.initialState = State()
    self.shareUseCase = shareUseCase
  }

  public func transform(action: Observable<Action>) -> Observable<Action> {
    return .merge(
      action,
      shareUseCase.allCategories().asObservable().map(Action.newCategories)
    )
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .newCategories(let categories):
      return .just(.updateCategories(categories))
    }
  }

  public func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .updateCategories(let categories):
      let categorySectionItems = self.categorySectionItems(with: categories)
      state.sections = [.categories(categorySectionItems)]
      return state
    }
  }

  private func categorySectionItems(with categories: [Category]) -> [BrowsingViewSectionItem] {
    categories
      .map(CategoryCellReactor.init)
      .map(BrowsingViewSectionItem.category)
  }
}

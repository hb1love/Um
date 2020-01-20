//
//  ShareListViewReactor.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import ShareService
import ReactorKit

public final class ShareListViewReactor: Reactor {
  public enum Action {

  }

  public struct State {

  }

  public let initialState: State
  public let shareUseCase: ShareUseCase

  public init(shareUseCase: ShareUseCase) {
    self.initialState = State()
    self.shareUseCase = shareUseCase
  }
}

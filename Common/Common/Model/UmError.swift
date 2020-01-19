//
//  UmError.swift
//  Common
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

public enum UmError: Error {
  public enum UmNetworkError: Error {
    case unknown
    case parsingFailed
    case requestFailed
  }

  public enum UmDomainError: Error {

  }

  case networkError(reason: UmNetworkError)
}

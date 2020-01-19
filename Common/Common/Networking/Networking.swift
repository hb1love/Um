//
//  Networking.swift
//  Common
//
//  Created by hb1love on 2020/01/19.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public final class Networking<Target: TargetType>: MoyaProvider<Target> {

  public init(plugins: [PluginType] = []) {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
    configuration.timeoutIntervalForRequest = 5
    
    let manager = Manager(configuration: configuration)
    manager.startRequestsImmediately = false
    super.init(manager: manager, plugins: plugins)
  }

  public func request(
    _ target: Target,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
  ) -> Single<Response> {
    let requestString = "\(target.method.rawValue) \(target.path)"
    return self.rx.request(target)
      .filterSuccessfulStatusCodes()
      .do(
        onSuccess: { value in
          let message = "SUCCESS: \(requestString) (\(value.statusCode))"
          log.debug(message)
      },
        onError: { error in
          if let response = (error as? MoyaError)?.response {
            if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
              let message = "FAILURE: \(requestString) (\(response.statusCode))\n\(jsonObject)"
              log.warning(message)
            } else if let rawString = String(data: response.data, encoding: .utf8) {
              let message = "FAILURE: \(requestString) (\(response.statusCode))\n\(rawString)"
              log.warning(message)
            } else {
              let message = "FAILURE: \(requestString) (\(response.statusCode))"
              log.warning(message)
            }
          } else {
            let message = "FAILURE: \(requestString)\n\(error)"
            log.warning(message)
          }
      },
        onSubscribed: {
          let message = "REQUEST: \(requestString)"
          log.debug(message)
      }
    )
  }
}

//
//  ShareAPI.swift
//  ShareService
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import Foundation
import Common
import Moya

typealias ShareNetworking = Networking<ShareAPI>

enum ShareAPI {
  case categories
  case feed
}

extension ShareAPI: TargetType {
  var baseURL: URL {
    return URL(string: shareServiceConfig.baseUrl)!
  }

  var path: String {
    switch self {
    case .categories:
      return "category"
    case .feed:
      return "feed"
    }
  }

  var method: Moya.Method {
    switch self {
    default:
      return .get
    }
  }

  var task: Task {
    switch self {
      //        case .spot(_, _, _, let deviceId):
      //            return .requestParameters(
      //                parameters: ["deviceId": deviceId],
      //                encoding: URLEncoding.default
      //            )
      //        case .spots(_, _, let spotParam, let deviceId):
      //            return .requestParameters(
      //                parameters: makeSpotsParameters(spotParam: spotParam, deviceId: deviceId),
      //                encoding: URLEncoding.default
      //            )
      //        case .setFavorite(let favoriteParam):
      //            return .requestParameters(
      //                parameters: makeFavoriteParameters(favoriteParam: favoriteParam),
      //                encoding: JSONEncoding.default
    //            )
    default:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }
  
  var sampleData: Data {
    switch self {
    default:
      return Data()
    }
  }
}

private extension ShareAPI {
    //    func makeSpotsParameters(spotParam: SpotParam, deviceId: String) -> [String: Any] {
    //        var parameters = [String: Any]()
    //        parameters["deviceId"] = deviceId
    //        parameters["distance"] = spotParam.distance
    //        parameters["size"] = spotParam.size
    //        parameters["page"] = 1
    //        if let categoryId = spotParam.categoryId {
    //            parameters["categoryId"] = categoryId
    //        }
    //        return parameters
    //    }
    //
    //    func makeFavoriteParameters(favoriteParam: FavoriteParam) -> [String: Any] {
    //        var parameters = [String: Any]()
    //        parameters["placeId"] = favoriteParam.placeId
    //        parameters["deviceId"] = favoriteParam.deviceId
    //        return parameters
    //    }
}

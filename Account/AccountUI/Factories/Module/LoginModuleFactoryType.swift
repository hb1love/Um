//
//  LoginModuleFactoryType.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

public protocol LoginModuleFactoryType {
  func makeLoginModule() -> LoginViewController
}

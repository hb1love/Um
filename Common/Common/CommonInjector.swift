//
//  CommonInjector.swift
//  Common
//
//  Created by hb1love on 2020/03/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import SwiftyBeaver

public class CommonInjector {
  public static func resolve() {
    let console = ConsoleDestination()
    log.addDestination(console)
  }
}

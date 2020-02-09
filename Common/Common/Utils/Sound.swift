//
//  Sound.swift
//  Common
//
//  Created by hb1love on 2020/02/04.
//  Copyright © 2020 depromeet. All rights reserved.
//

import AVFoundation

public enum Sound: UInt32 {
  case keyPressed = 1103

  public func play() {
    AudioServicesPlaySystemSound(rawValue)
  }
}

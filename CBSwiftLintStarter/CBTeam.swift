//
//  CBTeam.swift
//  SwiftLintStarter
//
//  Created by Daymein Gregorio on 3/11/20.
//  Copyright © 2020 Daymein Gregorio. All rights reserved.
//

import Foundation

enum CheerType: String {
  case best
  case defense
  case go
  
  func cheer() -> String {
    let cheer: String
    switch self.rawValue {
    case "best":
      cheer = "The {$0} are the best!"
    case "defense":
      cheer = "Defense! Defense!"
    case "go":
      cheer = "Go, {$0}! Go!"
    default:
      cheer = ""
    }
    return cheer
  }
  
}

struct DGTeam {
  
  let name: String
  let players: [CBPlayer]
  let mascotIconName: String
  let cheer: CheerType
  let winCount: Int
  let lossCount: Int
  
}





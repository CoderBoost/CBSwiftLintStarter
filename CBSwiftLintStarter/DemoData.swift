//
//  DemoData.swift
//  SwiftLintStarter
//
//  Created by Daymein Gregorio on 3/11/20.
//  Copyright © 2020 Daymein Gregorio. All rights reserved.
//

import Foundation

let p1 = CBPlayer(name: "Ken",
                  powerLevel: 4,
                  number: 5)
let p2 = CBPlayer(name: "Ryu",
                  powerLevel: 4,
                  number: 3)
let p3 = CBPlayer(name: "Akuma",
                  powerLevel: 5,
                  number: 4)
let p4 = CBPlayer(name: "Mario",
                  powerLevel: 4,
                  number: 5)
let p5 = CBPlayer(name: "Lugi",
                  powerLevel: 4,
                  number: 3)
let p6 = CBPlayer(name: "Peach",
                  powerLevel: 5,
                  number: 4)
let p7 = CBPlayer(name: "Cuphead",
                  powerLevel: 4,
                  number: 5)

let p8 = CBPlayer(name: "Mugman",
                  powerLevel: 4,
                  number: 3)

let p9 = CBPlayer(name: "Ms. Chalice",
                  powerLevel: 5,
                  number: 4)


let owls = DGTeam(name: "Owls",
                  players: [p1, p2, p3],
                  mascotIconName: "Owls", cheer: .best,
                  winCount: 3, lossCount: 5)

let piranhas = DGTeam(name: "Piranhas",
                      players: [p4, p5, p6],
                      mascotIconName: "Piranhas", cheer: .defense,
                      winCount: 6, lossCount: 2)

let zombies = DGTeam(name: "Zombies",
                     players: [p7, p8, p9],
                     mascotIconName: "Zombies", cheer: .go,
                     winCount: 0, lossCount: 5)


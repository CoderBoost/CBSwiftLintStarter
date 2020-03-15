//
//  CBTeamDetailsViewController.swift
//  SwiftLintStarter
//
//  Created by Daymein Gregorio on 3/11/20.
//  Copyright © 2020 Daymein Gregorio. All rights reserved.
//

import UIKit

class CBTeamDetailsViewController: CBBaseViewController {
  
  private let cheerLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize: 52, weight: .bold)
    lbl.textColor = ThemeColor.orange
    lbl.numberOfLines = 0
    return lbl
  }()
  
  var team: DGTeam?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = ThemeColor.bgGray
    navigationController?.navigationBar.tintColor = ThemeColor.white
    let team = self.team!
    cheerLabel.text = team.cheer.cheer().replacingOccurrences(of: "{$0}", with: team.name)
  }
  
  override func viewWillLayoutSubviews() {
    layoutCheerLabel()
  }
  
  private func layoutCheerLabel() {
    view.addSubview(cheerLabel)
    cheerLabel.translatesAutoresizingMaskIntoConstraints = false
    cheerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    cheerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    cheerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
  }

}

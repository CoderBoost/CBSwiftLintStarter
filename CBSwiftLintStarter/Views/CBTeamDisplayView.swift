//
//  CBTeamDisplayView.swift
//  SwiftLintStarter
//
//  Created by Daymein Gregorio on 6/1/19.
//  Copyright © 2019 Daymein Gregorio. All rights reserved.
//

import UIKit

protocol CBTeamDisplayViewDelegate {
  func didTapTeamDetailsButton()
}

class CBTeamDisplayView: UIView {
  
  static let viewHeight = CGFloat(182)
  
  var delegate: CBTeamDisplayViewDelegate?
  
  private var favoriteButton: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = ThemeColor.white
    return btn
  }()
  
  private var iconView: UIImageView = {
    let iV = UIImageView()
    iV.contentMode = .scaleAspectFit
    return iV
  }()
  
  private var teamNameLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    lbl.textColor = ThemeColor.white
    return lbl
  }()
  
  private var teamListLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    lbl.textColor = ThemeColor.white
    lbl.numberOfLines = 0
    return lbl
  }()
  
  private var recordLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    lbl.textColor = .white
    return lbl
  }()
  
  private var teamDetailsButton: UIButton = {
    let btn = UIButton()
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    btn.setTitleColor(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), for: .normal)
    btn.setTitle("details", for: .normal)
    btn.addTarget(self, action: #selector(detailsTapped), for: .touchUpInside)
    return btn
  }()
  
  func configure(for team: DGTeam) {
    backgroundColor =  ThemeColor.bgGray
    configureContent(for: team)
    layoutComponents()
  }
  
  func configureContent(for team: DGTeam) {
    if let img = UIImage(named: team.mascotIconName) {
      iconView.image = img
    }
    teamNameLabel.text = team.name == "" ? "Unknown Team" : team.name
    recordLabel.text = setRecordText(wins: team.winCount, losses: team.lossCount)
    teamListLabel.text = setTeamListText(players: team.players)
  }
  
  private func setRecordText(wins: Int, losses: Int) -> String {
    return "\(wins)W / \(losses)L"
  }
  
  private func setTeamListText(players: [CBPlayer]) -> String {
    let names = players.map { $0.name }
    return names.joined(separator: "\n")
  }
  
  private func layoutComponents() {
    layoutIconView()
    layoutTeamNameLabel()
    layoutTeamListLabel()
    layoutRecordLabel()
    layoutTeamDetailsButton()
  }
  
  @objc func detailsTapped() {
    guard delegate != nil else { return }
    delegate?.didTapTeamDetailsButton()
  }
  
}

//MARK: layout components
private extension CBTeamDisplayView {
  
  func layoutIconView() {
    addSubview(iconView)
    iconView.translatesAutoresizingMaskIntoConstraints = false
    iconView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
    iconView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    iconView.heightAnchor.constraint(equalToConstant: 150).isActive = true
  }
  
  func layoutTeamNameLabel() {
    addSubview(teamNameLabel)
    teamNameLabel.translatesAutoresizingMaskIntoConstraints = false
    teamNameLabel.topAnchor.constraint(equalTo: iconView.topAnchor).isActive = true
    teamNameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 16).isActive = true
    teamNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
  }
  
  func layoutTeamListLabel() {
    addSubview(teamListLabel)
    teamListLabel.translatesAutoresizingMaskIntoConstraints =  false
    teamListLabel.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 10).isActive = true
     teamListLabel.leftAnchor.constraint(equalTo: teamNameLabel.leftAnchor).isActive = true
    teamListLabel .rightAnchor.constraint(equalTo: teamNameLabel.rightAnchor).isActive = true
  }
  
  func layoutRecordLabel() {
    addSubview(recordLabel)
    recordLabel.translatesAutoresizingMaskIntoConstraints = false
    recordLabel.bottomAnchor.constraint(equalTo: iconView.bottomAnchor).isActive = true
    recordLabel.leftAnchor.constraint(equalTo: teamNameLabel.leftAnchor).isActive = true
    recordLabel.rightAnchor.constraint(equalTo: teamNameLabel.rightAnchor).isActive = true
  }
  
  func layoutTeamDetailsButton() {
    addSubview(teamDetailsButton)
    teamDetailsButton.translatesAutoresizingMaskIntoConstraints = false
    teamDetailsButton.bottomAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 7).isActive = true
    teamDetailsButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
  }
  
  
}

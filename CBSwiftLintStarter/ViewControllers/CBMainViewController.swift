//
//  CBMainViewController.swift
//  SwiftLintStarter
//
//  Created by Daymein Gregorio on 3/11/20.
//  Copyright © 2020 Daymein Gregorio. All rights reserved.
//

import UIKit

class CBMainViewController: CBBaseViewController, CBTeamDisplayViewDelegate {
  
  private var teamDisplayView: CBTeamDisplayView?
  private let cellID = "TeamCell"
  
  private let tV: UITableView = {
    let tV = UITableView()
    tV.backgroundColor = .clear
    return tV
  }()
  
  let teams = [owls, piranhas, zombies]
  var selectedTeam: DGTeam? {
    willSet {
      teamDisplayView!.configureContent(for: newValue!)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Team Fighter"
    view.backgroundColor = ThemeColor.bgGray
    configureNavBar()
    teamDisplayView = CBTeamDisplayView()
    setInitialTeam(teamDisplayView: teamDisplayView)
    configureTableView()
    setDelegates()
    layoutComponentViews()
  }
  
  func showZombieWarning(team: DGTeam?) {
    guard team?.name == "Zombies" else { return }
    showWarning(title: "🧟‍♀️🧟‍♂️🧟‍♀️🧟‍♂️", message: "I'm scared!\nPlease choose a different team.")
  }
  
  private func setInitialTeam(teamDisplayView: CBTeamDisplayView?) {
    selectedTeam = owls
    teamDisplayView?.configure(for: selectedTeam!)
  }
  
  private func configureNavBar() {
    navigationController!.navigationBar.largeTitleTextAttributes = [.foregroundColor: ThemeColor.orange]
    navigationController!.navigationBar.prefersLargeTitles = true
    navigationController!.navigationBar.barTintColor = ThemeColor.navBar
  }
  
  private func setDelegates() {
    teamDisplayView?.delegate  = self
    tV.dataSource = self
    tV.delegate = self
  }
  
  private func configureTableView() {
    tV.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    tV.estimatedRowHeight = 80
    tV.rowHeight = 80
    tV.separatorStyle = .none
  }
  
  private func layoutComponentViews() {
    layoutTeamDisplayView()
    layoutTableView()
  }
  
  func didTapTeamDetailsButton() {
    let detailsVC = CBTeamDetailsViewController()
    detailsVC.team = selectedTeam
    navigationController?.show(detailsVC, sender: self)
  }

}

// MARK: - TableViewDataSource functions
extension CBMainViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return teams.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
    }
    if teams.count >= indexPath.row {
      let txtLblAttribTxt = NSAttributedString(string: teams[indexPath.row].name,
                                               attributes: [.foregroundColor : ThemeColor.white,
                                                            .font: UIFont.systemFont(ofSize: 16, weight: .medium)])
      
      cell?.textLabel?.attributedText = txtLblAttribTxt
      cell?.imageView!.image = UIImage(named: teams[indexPath.row].mascotIconName)
      cell?.backgroundColor = ThemeColor.bgGray
    }
    
    return cell!
  }

}

// MARK: - TableViewDelegate functions
extension CBMainViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard teams.count >= indexPath.row else { return }
    selectedTeam = teams[indexPath.row]
    showZombieWarning(team: selectedTeam)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}

//MARK: -- layout component views
private extension CBMainViewController {
  
  func layoutTeamDisplayView() {
    view.addSubview(teamDisplayView!)
    teamDisplayView!.translatesAutoresizingMaskIntoConstraints = false
    teamDisplayView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    teamDisplayView?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    teamDisplayView?.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    teamDisplayView?.heightAnchor.constraint(equalToConstant: CBTeamDisplayView.viewHeight).isActive = true
  }
  
  func layoutTableView() {
    view.addSubview(tV)
    tV.translatesAutoresizingMaskIntoConstraints = false
    tV.topAnchor.constraint(equalTo: teamDisplayView!.bottomAnchor).isActive = true
    tV.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tV.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
}


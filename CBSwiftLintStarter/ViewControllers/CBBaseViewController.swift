//
//  CBBaseViewController.swift
//  CBSwiftLintStarter
//
//  Created by Daymein Gregorio on 3/15/20.
//  Copyright © 2020 Daymein Gregorio. All rights reserved.
//

import UIKit

class CBBaseViewController: UIViewController {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
  }
  
  func showWarning(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
    let alertCon = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "👍🏼", style: .default, handler: handler)
    alertCon.addAction(okAction)
    present(alertCon, animated: true)
  }

}

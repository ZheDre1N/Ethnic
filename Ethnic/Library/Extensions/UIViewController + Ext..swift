//
//  UIViewController + Ext..swift
//  Ethnic
//
//  Created by Eugene Dudkin on 24.03.2022.
//

import UIKit

extension UIViewController {
  func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
    let alertController: UIAlertController = .init(
      title: title,
      message: message,
      preferredStyle: UIAlertController.Style.alert
    )

    alertController.addAction(UIAlertAction(title: "Принять", style: UIAlertAction.Style.default))
    present(alertController, animated: true, completion: completion)
  }
}

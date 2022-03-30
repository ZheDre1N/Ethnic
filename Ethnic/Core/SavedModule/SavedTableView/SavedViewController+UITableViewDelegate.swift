//
//  SavedViewController+UITableViewDelegate.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 30.03.2022.
//

import UIKit

extension SavedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row) was tapped")
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

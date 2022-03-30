//
//  SavedViewController+UITableViewDataSource.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 30.03.2022.
//

import UIKit

extension SavedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: "SavedTableViewCell",
      for: indexPath
    ) as? SavedTableViewCell else {
      return UITableViewCell()
    }

    let cellModel = presenter.dataSource[indexPath.row]
    cell.configureCellData(with: cellModel)
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    "Russian - Erzian"
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    3
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    UITableView.automaticDimension
  }
}

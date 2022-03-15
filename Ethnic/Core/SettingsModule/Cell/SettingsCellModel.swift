//
//  SettingsCellModel.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 02.03.2022.
//

import UIKit

struct SettingsCellModel {
  let title: String
  let icon: UIImage?
  let iconBackgroundColor: UIColor
  let handler: () -> Void
}

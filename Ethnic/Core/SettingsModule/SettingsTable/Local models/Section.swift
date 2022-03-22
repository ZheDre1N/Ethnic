//
//  Section.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 22.03.2022.
//

import Foundation

struct Section {
  let title: String?
  let cells: [CustomCellType]
}

enum CustomCellType {
  case profileCell(model: ProfileCell)
  case staticCell(model: StaticCell)
  case switchCell(model: SwitchCell)
}

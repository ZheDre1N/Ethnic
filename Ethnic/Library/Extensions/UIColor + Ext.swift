//
//  UIColor + Ext.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 20.03.2022.
//

import UIKit

extension UIColor {
  static let ethnicTextColor = UIColor.black
  static let ethnicBlue = UIColor(named: "ethnicBlue") ?? systemBlue
}

extension UIColor {
  class var random: UIColor {
    return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
  }
}

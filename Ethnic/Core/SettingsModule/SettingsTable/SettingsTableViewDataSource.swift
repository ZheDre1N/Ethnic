//
//  SettingsTableViewDataSource.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 22.03.2022.
//

import UIKit

struct SettingsTableViewDataSource {
  var tableDataSource: [Section] = [
    Section(title: "Account", cells: [
      .staticCell(model: StaticCell(
  title: "Eugene Dudkin",
  icon: UIImage(systemName: "person.circle"),
  iconBackgroundColor: .systemPink,
  handler: nil
  ))]),
    
    
    
    Section(title: "Translation", cells: [
      .staticCell(model: StaticCell(title: "Default languages", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue, handler: nil)),
      .staticCell(model: StaticCell(title: "Storage", icon: UIImage(systemName: "star"), iconBackgroundColor: .systemPink, handler: nil)),
    ]),
    
    
    
    Section(title: "Support", cells: [
      .staticCell(model: StaticCell(title: "Feedback", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue, handler: nil)),
      .staticCell(model: StaticCell(title: "Help", icon: UIImage(systemName: "star"), iconBackgroundColor: .systemPink, handler: nil)),
      .switchCell(model: SwitchCell(title: "Send crash reports", icon: UIImage(systemName: "star"), iconBackgroundColor: .systemPink, handler: nil, isOn: true)),
      .staticCell(model: StaticCell(title: "About", icon: UIImage(systemName: "moon"), iconBackgroundColor: .red, handler: nil)),
    ]),
    
    
    
    Section(title: "Voice", cells: [
      .staticCell(model: StaticCell(title: "Speech input", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue, handler: nil)),
      .staticCell(model: StaticCell(title: "Speech region", icon: UIImage(systemName: "star"), iconBackgroundColor: .systemPink, handler: nil)),
      .staticCell(model: StaticCell(title: "Pronunciation speed", icon: UIImage(systemName: "moon"), iconBackgroundColor: .red, handler: nil)),
    ]),
    
    
    
    Section(title: nil, cells: [
      .staticCell(model: StaticCell(title: "Clear Translation History", icon: UIImage(systemName: "trash"), iconBackgroundColor: .systemRed, handler: nil)),
    ])
    
    
    
  
  
  
  
  ]
}

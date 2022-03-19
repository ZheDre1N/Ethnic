//
//  AuthorizedCoordinator.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 19.03.2022.
//

import Foundation
import UIKit

class AuthorizedCoordinator: Coordinatable {
  private let window: UIWindow?
  private let tabBarController: UITabBarController?

  init(
    window: UIWindow?,
    tabBarController: UITabBarController
  ) {
    self.window = window
    self.tabBarController = tabBarController
  }

  func start() {
    self.window?.rootViewController = tabBarController
    self.window?.makeKeyAndVisible()
  }
}

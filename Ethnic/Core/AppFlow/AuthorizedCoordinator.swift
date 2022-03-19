//
//  AuthorizedCoordinator.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 19.03.2022.
//

import Foundation
import UIKit

class AuthorizedCoordinator: AppCoordinatable {
  private let window: UIWindow?

  init(
    window: UIWindow?
  ) {
    self.window = window
  }

  func start() {
    self.window?.rootViewController = ScreensFactory.createTabBarController()
    self.window?.makeKeyAndVisible()
  }
}


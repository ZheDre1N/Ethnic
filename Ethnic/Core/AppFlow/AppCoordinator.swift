//
//  AppCoordinator.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 19.03.2022.
//

import UIKit

class AppCoordinator: AppCoordinatable {
  private let window: UIWindow?
  var starterCoordinator: AppCoordinatable?

  init(
    window: UIWindow? = UIWindow()
  ) {
    self.window = window
    setupStarterCoordinator()
  }

  func setupStarterCoordinator() {
    // The best place to check loggin user or not
    starterCoordinator = AuthorizedCoordinator(window: window)
  }

  func start() {
    starterCoordinator?.start()
  }
}

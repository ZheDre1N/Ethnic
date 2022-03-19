//
//  AppCoordinator.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 19.03.2022.
//

import UIKit

class AppCoordinator: Coordinatable {
  private let window: UIWindow?
  var starterCoordinator: Coordinatable?

  init(
    window: UIWindow? = UIWindow()
  ) {
    self.window = window
    setupStarterCoordinator()
  }

  func setupStarterCoordinator() {
    // The best place to check loggin user or not
    starterCoordinator = AuthorizedCoordinator(
      window: window,
      tabBarController: TabBarController()
    )
  }

  func start() {
    starterCoordinator?.start()
  }
}

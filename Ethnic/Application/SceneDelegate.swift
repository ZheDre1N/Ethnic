//
//  SceneDelegate.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 19.03.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  var appCoordinator: AppCoordinatable?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)
    appCoordinator = AppCoordinator(window: window)
    appCoordinator?.start()
  }
}

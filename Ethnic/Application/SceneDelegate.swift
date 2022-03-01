import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)
    let tabBarController = makeTabBarController()
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }

  private func makeTabBarController() -> UITabBarController {
    let tabBarController = TabBarController()

    let homeCoordinator = HomeCoordinator()
    let savedCoordinator = SavedCoordinator()
    let settingCoordinator = SettingsCoordinator()

    tabBarController.home = homeCoordinator
    tabBarController.saved = savedCoordinator
    tabBarController.settings = settingCoordinator
    return tabBarController
  }
}

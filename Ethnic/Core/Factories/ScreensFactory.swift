import UIKit

protocol ScreensFactorable {
  static func createTabBarController() -> UITabBarController
  static func createHomeModule() -> UIViewController
  static func createLanguageSelectionModule() -> UIViewController
  static func createSavedModule() -> UIViewController
  static func createSettingsModule() -> UIViewController
}

final class ScreensFactory: ScreensFactorable {
  // MARK: - Tabs.
  static func createTabBarController() -> UITabBarController {
    let tabBarController = TabBarController(
      home: HomeCoordinator(),
      saved: SavedCoordinator(),
      settings: SettingsCoordinator()
    )
    return tabBarController
  }

  // MARK: - Home tabs.
  static func createHomeModule() -> UIViewController {
    let view = HomeViewController()
    let presenter = HomePresenter(view: view)
    view.presenter = presenter
    return view
  }

  static func createLanguageSelectionModule() -> UIViewController {
    let view = LanguageSelectionViewController()
    let presenter = LanguageSelectionPresenter(view: view)
    view.presenter = presenter
    return view
  }

  // MARK: - Saved tabs.
  static func createSavedModule() -> UIViewController {
    let view = SavedViewController()
    let presenter = SavedPresenter(view: view)
    view.presenter = presenter
    return view
  }

  // MARK: - Settings tabs.
  static func createSettingsModule() -> UIViewController {
    let view = SettingsViewController()
    let presenter = SettingsPresenter(view: view)
    view.presenter = presenter
    return view
  }
}

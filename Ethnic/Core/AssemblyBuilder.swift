import UIKit

protocol AssemblyBuilderProtocol {
  func createHomeModule(router: HomeCoordinatorProtocol) -> UIViewController
  func createLanguageSelectionModule(router: HomeCoordinatorProtocol) -> UIViewController
  func createSavedModule(router: SavedCoordinatorProtocol) -> UIViewController
  func createSettingsModule(router: SettingsCoordinatorProtocol) -> UIViewController
}

final class AssemblyBuilder: AssemblyBuilderProtocol {
  // MARK: - Home tabs.
  func createHomeModule(router: HomeCoordinatorProtocol) -> UIViewController {
    let view = HomeViewController()
    let translateManager = TranslateManager()
    let presenter = HomePresenter(view: view, router: router, translateManager: translateManager)
    view.presenter = presenter
    return view
  }

  func createLanguageSelectionModule(router: HomeCoordinatorProtocol) -> UIViewController {
    let view = LanguageSelectionViewController()
    let presenter = LanguageSelectionPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }

  // MARK: - Saved tabs.
  func createSavedModule(router: SavedCoordinatorProtocol) -> UIViewController {
    let view = SavedViewController()
    let presenter = SavedPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }

  // MARK: - Settings tabs.
  func createSettingsModule(router: SettingsCoordinatorProtocol) -> UIViewController {
    let view = SettingsViewController()
    let presenter = SettingsPresenter(view: view, router: router)
    view.presenter = presenter
    return view
  }
}

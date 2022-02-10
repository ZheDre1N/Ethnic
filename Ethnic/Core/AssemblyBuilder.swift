import UIKit

protocol AssemblyBuilderProtocol {
    func createHomeModule(router: HomeRouterProtocol) -> UIViewController
    func createLanguageSelectionModule(router: HomeRouterProtocol) -> UIViewController
    func createSavedModule(router: SavedRouterProtocol) -> UIViewController
    func createSettingsModule(router: SettingsRouterProtocol) -> UIViewController
}

final class AssemblyBuilder: AssemblyBuilderProtocol {

    // MARK: - Home tabs.
    func createHomeModule(router: HomeRouterProtocol) -> UIViewController {
        let view = HomeViewController()
        let translateManager = TranslateManager()
        let presenter = HomePresenter(view: view, router: router, translateManager: translateManager)
        view.presenter = presenter
        return view
    }
    
    func createLanguageSelectionModule(router: HomeRouterProtocol) -> UIViewController {
        let view = LanguageSelectionViewController()
        let presenter = LanguageSelectionPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    // MARK: - Saved tabs.
    func createSavedModule(router: SavedRouterProtocol) -> UIViewController {
        let view = SavedViewController()
        let presenter = SavedPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }

    // MARK: - Settings tabs.
    func createSettingsModule(router: SettingsRouterProtocol) -> UIViewController {
        let view = SettingsViewController()
        let presenter = SettingsPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}

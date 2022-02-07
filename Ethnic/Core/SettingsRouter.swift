import UIKit

protocol SettingsRouterProtocol {
    var navigationController: UINavigationController { get set }
}

final class SettingsRouter: SettingsRouterProtocol {
    var navigationController: UINavigationController
    let assemblyBuilder = AssemblyBuilder()
    
    required init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        let view = assemblyBuilder.createSettingsModule(router: self)
        navigationController.viewControllers = [view]
    }
}

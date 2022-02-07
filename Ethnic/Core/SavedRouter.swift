import UIKit

protocol SavedRouterProtocol {
    var navigationController: UINavigationController { get set }
}

final class SavedRouter: SavedRouterProtocol {
    var navigationController: UINavigationController
    let assemblyBuilder = AssemblyBuilder()
    
    required init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        let view = assemblyBuilder.createSavedModule(router: self)
        navigationController.viewControllers = [view]
    }
}

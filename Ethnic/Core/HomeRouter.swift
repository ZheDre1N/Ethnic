import UIKit

protocol HomeRouterProtocol {
    var navigationController: UINavigationController { get set }
}

final class HomeRouter: HomeRouterProtocol {
    var navigationController: UINavigationController
    let assemblyBuilder = AssemblyBuilder()
    
    required init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        let view = assemblyBuilder.createHomeModule(router: self)
        navigationController.viewControllers = [view]
    }
}

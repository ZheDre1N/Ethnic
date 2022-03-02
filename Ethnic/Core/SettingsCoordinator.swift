import UIKit

protocol SettingsCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
}

final class SettingsCoordinator: SettingsCoordinatorProtocol {
  var navigationController: UINavigationController
  let assemblyBuilder = AssemblyBuilder()

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true
    
    self.navigationController = navVC
    let view = assemblyBuilder.createSettingsModule(router: self)
    navigationController.viewControllers = [view]
  }
}

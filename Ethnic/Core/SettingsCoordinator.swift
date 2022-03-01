import UIKit

protocol SettingsCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
}

final class SettingsCoordinator: SettingsCoordinatorProtocol {
  var navigationController: UINavigationController
  let assemblyBuilder = AssemblyBuilder()

  required init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
    let view = assemblyBuilder.createSettingsModule(router: self)
    navigationController.viewControllers = [view]
  }
}

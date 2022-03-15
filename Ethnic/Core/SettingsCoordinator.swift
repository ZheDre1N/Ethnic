import UIKit

protocol SettingsCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
}

final class SettingsCoordinator: SettingsCoordinatorProtocol {
  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true

    self.navigationController = navVC
    let view = AssemblyBuilder.createSettingsModule()
    navigationController.viewControllers = [view]
  }
}

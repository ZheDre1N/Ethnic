import UIKit

protocol SavedCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
}

final class SavedCoordinator: SavedCoordinatorProtocol {
  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true

    self.navigationController = navVC
    let view = AssemblyBuilder.createSavedModule()
    navigationController.viewControllers = [view]
  }
}

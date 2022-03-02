import UIKit

protocol SavedCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
}

final class SavedCoordinator: SavedCoordinatorProtocol {
  var navigationController: UINavigationController
  let assemblyBuilder = AssemblyBuilder()

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true

    self.navigationController = navVC
    let view = assemblyBuilder.createSavedModule(router: self)
    navigationController.viewControllers = [view]
  }
}

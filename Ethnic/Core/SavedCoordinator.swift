import UIKit

protocol SavedCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
}

final class SavedCoordinator: SavedCoordinatorProtocol {
  var navigationController: UINavigationController
  let assemblyBuilder = AssemblyBuilder()

  required init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
    let view = assemblyBuilder.createSavedModule(router: self)
    navigationController.viewControllers = [view]
  }
}

import UIKit

final class SavedCoordinator: ChildCoordinatable {
  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true
    self.navigationController = navVC
    let view = ScreensFactory.createSavedModule()
    self.navigationController.pushViewController(view, animated: false)
  }
}

extension SavedCoordinator {}

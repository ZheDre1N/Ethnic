import UIKit

final class SavedCoordinator: ChildCoordinatable {
  func start() {
    //
  }

  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true

    self.navigationController = navVC
    let view = ScreensFactory.createSavedModule()
    navigationController.viewControllers = [view]
  }
}

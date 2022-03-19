import UIKit

final class SettingsCoordinator: ChildCoordinatable {
  func start() {
    //
  }
  
  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true

    self.navigationController = navVC
    let view = ScreensFactory.createSettingsModule()
    navigationController.viewControllers = [view]
  }
}

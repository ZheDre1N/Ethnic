import UIKit

final class SettingsCoordinator: ChildCoordinatable {
  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true
    self.navigationController = navVC
    let view = ScreensFactory.createSettingsModule()
    self.navigationController.pushViewController(view, animated: false)
  }
}

extension SettingsCoordinator {}

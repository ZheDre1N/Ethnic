import UIKit

final class HomeCoordinator: ChildCoordinatable {
  func start() {
    //
  }

  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true
    self.navigationController = navVC
    let view = ScreensFactory.createHomeModule()
    self.navigationController.pushViewController(view, animated: true)
  }

  func goToChangeLanguageScreen(from viewController: UIViewController) {
    let view = ScreensFactory.createLanguageSelectionModule()
    viewController.present(view, animated: true, completion: nil)
  }
}

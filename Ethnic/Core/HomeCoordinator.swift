import UIKit

protocol HomeCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
  func goToChangeLanguageScreen(from: UIViewController)
}

final class HomeCoordinator: HomeCoordinatorProtocol {
  var navigationController: UINavigationController

  required init() {
    let navVC = UINavigationController()
    navVC.navigationBar.prefersLargeTitles = true
    self.navigationController = navVC
    let view = AssemblyBuilder.createHomeModule()
    navigationController.viewControllers = [view]
  }

  func goToChangeLanguageScreen(from viewController: UIViewController) {
    let view = AssemblyBuilder.createLanguageSelectionModule()
    viewController.present(view, animated: true, completion: nil)
  }
}

import UIKit

protocol HomeCoordinatorProtocol {
  var navigationController: UINavigationController { get set }
  func goToChangeLanguageScreen(from: UIViewController)
}

final class HomeCoordinator: HomeCoordinatorProtocol {
  var navigationController: UINavigationController
  let assemblyBuilder = AssemblyBuilder()

  required init() {
    self.navigationController = UINavigationController()
    let view = assemblyBuilder.createHomeModule(router: self)
    navigationController.viewControllers = [view]
  }

  func goToChangeLanguageScreen(from viewController: UIViewController) {
    let view = assemblyBuilder.createLanguageSelectionModule(router: self)
    viewController.present(view, animated: true, completion: nil)
  }
}

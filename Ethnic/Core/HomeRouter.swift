import UIKit

protocol HomeRouterProtocol {
  var navigationController: UINavigationController { get set }
  func goToChangeLanguageScreen(from: UIViewController)
}

final class HomeRouter: HomeRouterProtocol {
  var navigationController: UINavigationController
  let assemblyBuilder = AssemblyBuilder()

  required init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
    let view = assemblyBuilder.createHomeModule(router: self)
    navigationController.viewControllers = [view]
  }

  func goToChangeLanguageScreen(from viewController: UIViewController) {
    let view = assemblyBuilder.createLanguageSelectionModule(router: self)
    viewController.present(view, animated: true, completion: nil)
  }
}

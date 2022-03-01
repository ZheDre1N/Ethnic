import Foundation

protocol LanguageSelectionViewProtocol: AnyObject {
}

protocol LanguageSelectionViewPresenterProtocol: AnyObject {
  init(view: LanguageSelectionViewProtocol, router: HomeRouterProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class LanguageSelectionPresenter: LanguageSelectionViewPresenterProtocol {
  weak var view: LanguageSelectionViewProtocol?
  var router: HomeRouterProtocol
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: LanguageSelectionViewProtocol, router: HomeRouterProtocol) {
    self.view = view
    self.router = router
  }
}

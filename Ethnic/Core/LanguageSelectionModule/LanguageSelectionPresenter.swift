import Foundation

protocol LanguageSelectionViewProtocol: AnyObject {
}

protocol LanguageSelectionViewPresenterProtocol: AnyObject {
  init(view: LanguageSelectionViewProtocol, router: HomeCoordinatorProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class LanguageSelectionPresenter: LanguageSelectionViewPresenterProtocol {
  weak var view: LanguageSelectionViewProtocol?
  var router: HomeCoordinatorProtocol
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: LanguageSelectionViewProtocol, router: HomeCoordinatorProtocol) {
    self.view = view
    self.router = router
  }
}

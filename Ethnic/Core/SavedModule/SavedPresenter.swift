import Foundation

protocol SavedViewProtocol: AnyObject {
}

protocol SavedViewPresenterProtocol: AnyObject {
  init(view: SavedViewProtocol, router: SavedCoordinatorProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class SavedPresenter: SavedViewPresenterProtocol {
  weak var view: SavedViewProtocol?
  var router: SavedCoordinatorProtocol
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: SavedViewProtocol, router: SavedCoordinatorProtocol) {
    self.view = view
    self.router = router
  }
}

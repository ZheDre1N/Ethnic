import Foundation

protocol SavedViewProtocol: AnyObject {
}

protocol SavedViewPresenterProtocol: AnyObject {
  init(view: SavedViewProtocol, router: SavedRouterProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class SavedPresenter: SavedViewPresenterProtocol {
  weak var view: SavedViewProtocol?
  var router: SavedRouterProtocol
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: SavedViewProtocol, router: SavedRouterProtocol) {
    self.view = view
    self.router = router
  }
}

import Foundation

protocol SavedViewProtocol: AnyObject {
}

protocol SavedViewPresenterProtocol: AnyObject {
  init(view: SavedViewProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class SavedPresenter: SavedViewPresenterProtocol {
  weak var view: SavedViewProtocol?
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: SavedViewProtocol) {
    self.view = view
  }
}

import Foundation

protocol SavedViewProtocol: AnyObject {
}

protocol SavedViewPresenterProtocol: AnyObject {
  init(view: SavedViewProtocol)

}

final class SavedPresenter: SavedViewPresenterProtocol {
  weak var view: SavedViewProtocol?

  required init(view: SavedViewProtocol) {
    self.view = view
  }
}

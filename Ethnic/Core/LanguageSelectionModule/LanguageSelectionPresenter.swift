import Foundation

protocol LanguageSelectionViewProtocol: AnyObject {
}

protocol LanguageSelectionViewPresenterProtocol: AnyObject {
  init(view: LanguageSelectionViewProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class LanguageSelectionPresenter: LanguageSelectionViewPresenterProtocol {
  weak var view: LanguageSelectionViewProtocol?
  var coordinator: HomeCoordinatorProtocol?
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: LanguageSelectionViewProtocol) {
    self.view = view
  }
}

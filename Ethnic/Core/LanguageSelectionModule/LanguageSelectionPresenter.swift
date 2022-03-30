import Foundation

protocol LanguageSelectionViewProtocol: AnyObject {
}

protocol LanguageSelectionViewPresenterProtocol: AnyObject {
  init(view: LanguageSelectionViewProtocol)

  var dataSource: [Language] { get }
}

final class LanguageSelectionPresenter: LanguageSelectionViewPresenterProtocol {
  weak var view: LanguageSelectionViewProtocol?
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: LanguageSelectionViewProtocol) {
    self.view = view
  }
}

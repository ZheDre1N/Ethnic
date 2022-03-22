import Foundation

protocol SettingsViewProtocol: AnyObject {
}

protocol SettingsViewPresenterProtocol: AnyObject {
  init(view: SettingsViewProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class SettingsPresenter: SettingsViewPresenterProtocol {
  weak var view: SettingsViewProtocol?
  var dataSource = StorageManager().getListOfLanguages() + StorageManager().getListOfLanguages()

  required init(view: SettingsViewProtocol) {
    self.view = view
  }
}

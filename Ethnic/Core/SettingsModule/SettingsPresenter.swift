import Foundation

protocol SettingsViewProtocol: AnyObject {
}

protocol SettingsViewPresenterProtocol: AnyObject {
  init(view: SettingsViewProtocol, router: SettingsCoordinatorProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class SettingsPresenter: SettingsViewPresenterProtocol {
  weak var view: SettingsViewProtocol?
  var router: SettingsCoordinatorProtocol
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: SettingsViewProtocol, router: SettingsCoordinatorProtocol) {
    self.view = view
    self.router = router
  }
}

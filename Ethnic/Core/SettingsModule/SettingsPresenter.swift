import Foundation

protocol SettingsViewProtocol: AnyObject {
}

protocol SettingsViewPresenterProtocol: AnyObject {
  init(view: SettingsViewProtocol, router: SettingsRouterProtocol)

  var dataSource: [LanguageProtocol] { get }
}

final class SettingsPresenter: SettingsViewPresenterProtocol {
  weak var view: SettingsViewProtocol?
  var router: SettingsRouterProtocol
  var dataSource = StorageManager().getListOfLanguages()

  required init(view: SettingsViewProtocol, router: SettingsRouterProtocol) {
    self.view = view
    self.router = router
  }
}

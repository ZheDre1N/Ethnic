import Foundation

protocol SettingsViewProtocol: AnyObject {
}

protocol SettingsViewPresenterProtocol: AnyObject {
  init(view: SettingsViewProtocol)

  var tableDataSource: [Section] { get }
}

final class SettingsPresenter: SettingsViewPresenterProtocol {
  weak var view: SettingsViewProtocol?
  var tableDataSource = SettingsTableViewModel().dataSource

  required init(view: SettingsViewProtocol) {
    self.view = view
  }
}

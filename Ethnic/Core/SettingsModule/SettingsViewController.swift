import UIKit

final class SettingsViewController: UIViewController {
  // MARK: - Public properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: SettingsViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional

  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Настройки"
  }
}

// MARK: - HomeViewProtocol.
extension SettingsViewController: SettingsViewProtocol {
}

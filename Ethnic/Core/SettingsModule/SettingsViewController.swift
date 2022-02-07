import UIKit

final class SettingsViewController: BaseViewController {

    // MARK: - Public properties.
    var presenter: SettingsViewPresenterProtocol!
    
    // MARK: - View controller life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - HomeViewProtocol.
extension SettingsViewController: SettingsViewProtocol {

}

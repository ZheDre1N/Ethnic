import UIKit

final class LanguageSelectionViewController: UIViewController {

    // MARK: - Public properties.
    var presenter: LanguageSelectionViewPresenterProtocol!
    
    // MARK: - View controller life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - HomeViewProtocol.
extension LanguageSelectionViewController: LanguageSelectionViewProtocol {

}

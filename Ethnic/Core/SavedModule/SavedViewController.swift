import UIKit

final class SavedViewController: UIViewController {

    // MARK: - Public properties.
    var presenter: SavedViewPresenterProtocol!
    
    // MARK: - View controller life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - HomeViewProtocol.
extension SavedViewController: SavedViewProtocol {

}

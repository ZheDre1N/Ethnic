import UIKit

final class SavedViewController: UIViewController {

    // MARK: - Public properties.
    var presenter: SavedViewPresenterProtocol!
    
    // MARK: - View controller life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сохраненное"
    }
}

// MARK: - HomeViewProtocol.
extension SavedViewController: SavedViewProtocol {

}

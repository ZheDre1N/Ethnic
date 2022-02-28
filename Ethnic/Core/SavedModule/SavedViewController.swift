import UIKit

final class SavedViewController: UIViewController {
  // MARK: - Public properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: SavedViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional

  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Сохраненное"
  }
}

// MARK: - HomeViewProtocol.
extension SavedViewController: SavedViewProtocol {
}

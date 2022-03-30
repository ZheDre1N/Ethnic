import UIKit

final class SavedViewController: UIViewController {
  // MARK: - Properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: SavedViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional

  // MARK: - NIB OUTLETS.
  @IBOutlet weak var tableView: UITableView!


  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGroupedBackground
    title = "Сохраненное"
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "SavedTableViewCell")
  }
}

// MARK: - SavedViewProtocol.
extension SavedViewController: SavedViewProtocol {
}

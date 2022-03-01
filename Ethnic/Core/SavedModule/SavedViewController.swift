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
    title = "Сохраненное"
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
}

// MARK: - SavedViewProtocol.
extension SavedViewController: SavedViewProtocol {
}

extension SavedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.dataSource.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let cellDataSource = presenter.dataSource[indexPath.row]
    cell.textLabel?.text = cellDataSource.name
    return cell
  }
}

extension SavedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row) was tapped")
  }
}

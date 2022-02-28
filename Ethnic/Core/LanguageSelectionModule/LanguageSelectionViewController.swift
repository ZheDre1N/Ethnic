import UIKit

final class LanguageSelectionViewController: UIViewController {
  // MARK: - Outlets.
  @IBOutlet weak var tableView: UITableView!

  // MARK: - Public properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: LanguageSelectionViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional


  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
}

// MARK: - HomeViewProtocol.
extension LanguageSelectionViewController: LanguageSelectionViewProtocol {
}

extension LanguageSelectionViewController: UITableViewDataSource {
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

extension LanguageSelectionViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row) was tapped")
  }
}

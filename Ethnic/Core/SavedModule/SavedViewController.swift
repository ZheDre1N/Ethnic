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

extension SavedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.dataSource.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as! SavedTableViewCell
    let cellModel = presenter.dataSource[indexPath.row]
    cell.configureCellData(with: cellModel)
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    "Русский-Эрзянский"
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    UITableView.automaticDimension
  }
}

extension SavedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row) was tapped")
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

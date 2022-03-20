import UIKit

final class SettingsViewController: UIViewController {
  // MARK: - Public properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: SettingsViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional

  // MARK: - NIB OUTLETS.
  @IBOutlet weak var tableView: UITableView!

  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGroupedBackground
    title = "Настройки"
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(DefaultSettingsViewCell.self, forCellReuseIdentifier: DefaultSettingsViewCell.description())
  }
}

// MARK: - HomeViewProtocol.
extension SettingsViewController: SettingsViewProtocol {
}

extension SettingsViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    32
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    32
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.dataSource.count
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    "Support"
  }

  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    "Footer"
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DefaultSettingsViewCell.description(), for: indexPath)
    let cellDataSource = presenter.dataSource[indexPath.row]

    var content = cell.defaultContentConfiguration()
    content.image = UIImage(named: "ethnic_texture")
    content.imageProperties.cornerRadius = 8
    content.imageProperties.maximumSize = CGSize(width: 32, height: 32)
    content.text = cellDataSource.name
    content.imageProperties.tintColor = .red
    cell.contentConfiguration = content
    return cell
  }
}

extension SettingsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row) was tapped")
  }
}

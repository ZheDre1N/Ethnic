import UIKit

final class SettingsViewController: UIViewController {
  // MARK: - Public properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: SettingsViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional

  // MARK: - NIB OUTLETS.
  @IBOutlet weak var tableView: UITableView!
  var tableDataSource = [Section]()

  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    tableDataSource = presenter.tableDataSource
    view.backgroundColor = .systemGroupedBackground
    title = "Настройки"
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.description())
    tableView.register(StaticTableViewCell.self, forCellReuseIdentifier: StaticTableViewCell.description())
    tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.description())
  }
}

// MARK: - HomeViewProtocol.
extension SettingsViewController: SettingsViewProtocol {
}

extension SettingsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let section = tableDataSource[section]
    return section.title
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    tableDataSource.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableDataSource[section].cells.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellModel = tableDataSource[indexPath.section].cells[indexPath.row]

    switch cellModel.self {
    case .profileCell(let model):
      let cell = tableView.dequeueReusableCell(
        withIdentifier: ProfileTableViewCell.description(),
        for: indexPath
      ) as! ProfileTableViewCell
      cell.configure(with: model)
      return cell

    case .staticCell(let model):
      let cell = tableView.dequeueReusableCell(
        withIdentifier: StaticTableViewCell.description(),
        for: indexPath
      ) as! StaticTableViewCell
      cell.configure(with: model)
      return cell

    case .switchCell(let model):
      let cell = tableView.dequeueReusableCell(
        withIdentifier: SwitchTableViewCell.description(),
        for: indexPath
      ) as! SwitchTableViewCell
      cell.configure(with: model)
      return cell
    }
  }
}

extension SettingsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    let type = tableDataSource[indexPath.section].cells[indexPath.row]

    switch type.self {
    case .profileCell(let model):
      if let handler = model.handler {
        handler()
      }
    case .staticCell(let model):
      if let handler = model.handler {
        handler()
      }
    case .switchCell(let model):
      if let handler = model.handler {
        handler()
      }
    }
  }
}

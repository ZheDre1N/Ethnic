import UIKit
import CoreData

final class SavedViewController: UIViewController {
  // MARK: - Properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: SavedViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional

  // MARK: - NIB OUTLETS.
  @IBOutlet weak var tableView: UITableView!
  var fetchResultController: NSFetchedResultsController<TranslationMO>!

  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGroupedBackground
    title = "Сохраненное"
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "SavedTableViewCell")

    // Core data
    let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
    let fetchRequest: NSFetchRequest<TranslationMO> = TranslationMO.fetchRequest()
    fetchRequest.fetchLimit = 15
    fetchRequest.sortDescriptors = [sortDescriptor]

    fetchResultController = NSFetchedResultsController(
      fetchRequest: fetchRequest,
      managedObjectContext: CoreDataManager().viewContext,
      sectionNameKeyPath: nil,
      cacheName: nil
    )
    fetchResultController.delegate = self

  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    try? fetchResultController.performFetch()
    tableView.reloadData()
  }
}

// MARK: - SavedViewProtocol.
extension SavedViewController: SavedViewProtocol {
}

extension SavedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let section = fetchResultController.sections?[section]
    return section?.numberOfObjects ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: "SavedTableViewCell",
      for: indexPath
    ) as? SavedTableViewCell else {
      return UITableViewCell()
    }

    let cellModel = fetchResultController.object(at: indexPath)
    cell.configureCellData(with: cellModel)
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let section = fetchResultController.sections?[section]
    return section?.name
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    fetchResultController.sections?.count ?? 0
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    UITableView.automaticDimension
  }
}

extension SavedViewController: NSFetchedResultsControllerDelegate {
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type {
    case .insert:
      if let indexPath = indexPath {
        tableView.insertRows(at: [indexPath], with: .automatic)
      }
    case .delete:
      break
    case .move:
      break
    case .update:
      break
    @unknown default:
      break
    }
  }
}

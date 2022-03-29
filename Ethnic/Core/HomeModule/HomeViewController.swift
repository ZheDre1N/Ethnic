import UIKit

protocol HomeViewProtocol: AnyObject {
  func setTargetText(targetText: String)
}

final class HomeViewController: UIViewController {
  // MARK: - Properties.
  // swiftlint:disable implicitly_unwrapped_optional
  var presenter: HomeViewPresenterProtocol!
  // swiftlint:enable implicitly_unwrapped_optional

  // MARK: - NIB OUTLETS.
  @IBOutlet weak var sourceTextView: UITextView!

  // MARK: - View controller life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGroupedBackground
    title = "Переводчик"
  }

  // MARK: - NIB ACTIONS.
  @IBAction func sourceLanguageButtonTapped(_ sender: UIButton) {
    presenter.goToLanguageSelectionScreen(from: self)
    print("source")
    let user = CoreDataManager().getMainUser()
    print(user.name)
    CoreDataManager().updateUser(with: "123")
    print(user.name)

  }

  @IBAction func swapLanguageButtonTapped(_ sender: UIButton) {
    print("swap")
  }

  @IBAction func targetLanguageButtonTapped(_ sender: UIButton) {
    presenter.goToLanguageSelectionScreen(from: self)
    print("target")
  }

  @IBAction func translateButtonTapped(_ sender: UIButton) {
    if let sourceText = sourceTextView.text {
      self.presenter.translateText(sourceText: sourceText)
    }
  }
}
// MARK: - HomeViewProtocol.
extension HomeViewController: HomeViewProtocol {
  func setTargetText(targetText: String) {
//    targetTextView.text = targetText
  }
}

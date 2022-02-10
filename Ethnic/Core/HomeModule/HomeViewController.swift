import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties.
    var presenter: HomeViewPresenterProtocol!
    
    // MARK: - NIB OUTLETS.
    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var targetTextView: UITextView!
    
    // MARK: - View controller life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Переводчик"
    }
    
    // MARK: - NIB ACTIONS.
    @IBAction func sourceLanguageButtonTapped(_ sender: UIButton) {
        presenter.goToLanguageSelectionScreen(from: self)
        print("source")
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
        targetTextView.text = targetText
    }
}

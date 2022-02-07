import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Public properties.
    var presenter: HomeViewPresenterProtocol!
    
    // MARK: - View controller life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Переводчик"
    }
    
    func translateButtonTapped() {
        self.presenter.translateText(sourceText: "Привет")
    }
}

// MARK: - HomeViewProtocol.
extension HomeViewController: HomeViewProtocol {
    func setTargetText(targetText: String) {
        // targetTextView.text = targetText
    }
}

import Foundation

protocol HomeViewProtocol: AnyObject {
    func setTargetText(targetText: String)
}

protocol HomeViewPresenterProtocol: AnyObject {
    init(view: HomeViewProtocol, router: HomeRouterProtocol)
    
    func translateText(sourceText: String)
    func updateTargetTextView(targetText: String)
}

final class HomePresenter: HomeViewPresenterProtocol {

    var view: HomeViewProtocol
    var router: HomeRouterProtocol
        
    required init(view: HomeViewProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func translateText(sourceText: String) {
        let translateManager = TranslateManager()      
        
        translateManager.translateText(sourceLanguage: "rus", targetLanguage: "myv", sourceText: sourceText) { [weak self] targetText in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.updateTargetTextView(targetText: targetText)
            }
        }
    }
    
    func updateTargetTextView(targetText: String) {
        self.view.setTargetText(targetText: targetText)
    }
}

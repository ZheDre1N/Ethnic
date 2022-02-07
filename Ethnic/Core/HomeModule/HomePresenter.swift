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
        // translate text and call updateTargetTextView
        
        // start completion handller
        updateTargetTextView(targetText: "Шумбрат")
        // end of completion handler
    }

    
    func updateTargetTextView(targetText: String) {
        self.view.setTargetText(targetText: targetText)
    }
}

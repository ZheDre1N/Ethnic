import Foundation

protocol LanguageSelectionViewProtocol: AnyObject {
}

protocol LanguageSelectionViewPresenterProtocol: AnyObject {
    init(view: LanguageSelectionViewProtocol, router: HomeRouterProtocol)
    

}

final class LanguageSelectionPresenter: LanguageSelectionViewPresenterProtocol {

    var view: LanguageSelectionViewProtocol
    var router: HomeRouterProtocol
        
    required init(view: LanguageSelectionViewProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.router = router
    }
}

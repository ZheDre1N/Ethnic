import Foundation

protocol SavedViewProtocol: AnyObject {
}

protocol SavedViewPresenterProtocol: AnyObject {
    init(view: SavedViewProtocol, router: SavedRouterProtocol)
    

}

final class SavedPresenter: SavedViewPresenterProtocol {

    weak var view: SavedViewProtocol?
    var router: SavedRouterProtocol
        
    required init(view: SavedViewProtocol, router: SavedRouterProtocol) {
        self.view = view
        self.router = router
    }
}

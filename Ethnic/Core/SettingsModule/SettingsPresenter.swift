import Foundation

protocol SettingsViewProtocol: AnyObject {
}

protocol SettingsViewPresenterProtocol: AnyObject {
    init(view: SettingsViewProtocol, router: SettingsRouterProtocol)
    

}

final class SettingsPresenter: SettingsViewPresenterProtocol {

    var view: SettingsViewProtocol
    var router: SettingsRouterProtocol
        
    required init(view: SettingsViewProtocol, router: SettingsRouterProtocol) {
        self.view = view
        self.router = router
    }
}

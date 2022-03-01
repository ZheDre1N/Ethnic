import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
  func setTargetText(targetText: String)
}

protocol HomeViewPresenterProtocol: AnyObject {
  init(view: HomeViewProtocol, router: HomeCoordinatorProtocol, translateManager: TranslateManagerProtocol)
  func goToLanguageSelectionScreen(from: UIViewController)
  func translateText(sourceText: String)
  func updateTargetTextView(targetText: String)
}

final class HomePresenter: HomeViewPresenterProtocol {
  weak var view: HomeViewProtocol?
  var router: HomeCoordinatorProtocol
  var translateManager: TranslateManagerProtocol

  required init(view: HomeViewProtocol, router: HomeCoordinatorProtocol, translateManager: TranslateManagerProtocol) {
    self.view = view
    self.router = router
    self.translateManager = translateManager
  }

  func translateText(sourceText: String) {
    translateManager.translateText(
      sourceLanguageKey: "rus",
      targetLanguageKey: "myv",
      sourceText: sourceText
    ) { result in
      switch result {
      case .success(let targetText):
        DispatchQueue.main.async {
          self.updateTargetTextView(targetText: targetText)
        }
      case .failure(let error):
        DispatchQueue.main.async {
          print(error)
          self.updateTargetTextView(
            targetText: "Произошла ошибка, пожалуйста, свяжитесь с разработчиком\n" + error.localizedDescription
          )
        }
      }
    }
  }

  func updateTargetTextView(targetText: String) {
    self.view?.setTargetText(targetText: targetText)
  }

  func goToLanguageSelectionScreen(from viewController: UIViewController) {
    router.goToChangeLanguageScreen(from: viewController)
  }
}

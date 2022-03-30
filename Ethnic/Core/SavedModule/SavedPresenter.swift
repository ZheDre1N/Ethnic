import Foundation

protocol SavedViewProtocol: AnyObject {
}

protocol SavedViewPresenterProtocol: AnyObject {
  init(view: SavedViewProtocol)

  var dataSource: [Translation] { get set }
}

final class SavedPresenter: SavedViewPresenterProtocol {
  weak var view: SavedViewProtocol?
  var dataSource: [Translation] = [
    Translation(
      sourceLanguage: Language(name: "Erzian", key: "myv"),
      targetLanguage: Language(name: "Russian", key: "rus"),
      sourceText: "Шумбрат!",
      targetText: "Привет!",
      date: Date(),
      isFavourite: false
    ),
    Translation(
      sourceLanguage: Language(name: "Erzian", key: "myv"),
      targetLanguage: Language(name: "Russian", key: "rus"),
      sourceText: "Кода тевтне?",
      targetText: "Как дела?",
      date: Date(),
      isFavourite: false
    )
  ]

  required init(view: SavedViewProtocol) {
    self.view = view
  }
}

import Foundation

protocol StorageManagerProtocol {
  // get
  func getListOfLanguages() -> [LanguageProtocol]
  func getUsersSourceLanguage() -> LanguageProtocol?
  func getUsersTargetLanguage() -> LanguageProtocol?

  // save
  func saveUsersSourceLanguage(sourceLanguage: LanguageProtocol)
  func saveUsersTargetLanguage(targetLanguage: LanguageProtocol)
  func addToHistory(tranlation: TranslationProtocol)
}

class StorageManager: StorageManagerProtocol {
  // get
  func getListOfLanguages() -> [LanguageProtocol] {
    let languages: [LanguageProtocol] = [
      Language(name: "Русский", key: "rus"),
      Language(name: "Эрзянский", key: "myv")
    ]

    return languages
  }

  func getUsersSourceLanguage() -> LanguageProtocol? {
    let languageObject = UserDefaults.standard.object(forKey: "sourceLanguage")
    guard let languageObject = languageObject else { return nil }
    if let language = languageObject as? LanguageProtocol {
      return language
    } else {
      return nil
    }
  }

  func getUsersTargetLanguage() -> LanguageProtocol? {
    let languageObject = UserDefaults.standard.object(forKey: "targetLanguage")
    guard let languageObject = languageObject else { return nil }
    if let language = languageObject as? LanguageProtocol {
      return language
    } else {
      return nil
    }
  }

  // save
  func saveUsersSourceLanguage(sourceLanguage: LanguageProtocol) {
    UserDefaults.standard.set(sourceLanguage, forKey: "sourceLanguage")
  }

  func saveUsersTargetLanguage(targetLanguage: LanguageProtocol) {
    UserDefaults.standard.set(targetLanguage, forKey: "targetLanguage")
  }

  func addToHistory(tranlation: TranslationProtocol) {
    UserDefaults.standard.set(tranlation, forKey: "history")
  }
}

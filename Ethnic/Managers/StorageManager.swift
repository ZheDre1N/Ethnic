import Foundation

protocol StorageManagerProtocol {
  // get
  func getListOfLanguages() -> [Language]
  func getUsersSourceLanguage() -> Language?
  func getUsersTargetLanguage() -> Language?

  // save
  func saveUsersSourceLanguage(sourceLanguage: Language)
  func saveUsersTargetLanguage(targetLanguage: Language)
  func addToHistory(tranlation: Translation)
}

class StorageManager: StorageManagerProtocol {
  // get
  func getListOfLanguages() -> [Language] {
    let languages: [Language] = [
      Language(name: "Русский", key: "rus"),
      Language(name: "Эрзянский", key: "myv")
    ]

    return languages
  }

  func getUsersSourceLanguage() -> Language? {
    let languageObject = UserDefaults.standard.object(forKey: "sourceLanguage")
    guard let languageObject = languageObject else { return nil }
    if let language = languageObject as? Language {
      return language
    } else {
      return nil
    }
  }

  func getUsersTargetLanguage() -> Language? {
    let languageObject = UserDefaults.standard.object(forKey: "targetLanguage")
    guard let languageObject = languageObject else { return nil }
    if let language = languageObject as? Language {
      return language
    } else {
      return nil
    }
  }

  // save
  func saveUsersSourceLanguage(sourceLanguage: Language) {
    UserDefaults.standard.set(sourceLanguage, forKey: "sourceLanguage")
  }

  func saveUsersTargetLanguage(targetLanguage: Language) {
    UserDefaults.standard.set(targetLanguage, forKey: "targetLanguage")
  }

  func addToHistory(tranlation: Translation) {
    UserDefaults.standard.set(tranlation, forKey: "history")
  }
}

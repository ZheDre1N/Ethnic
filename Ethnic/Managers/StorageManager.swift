import Foundation

protocol StorageManagerProtocol {
    func getLanguages() -> [LanguageProtocol]
}

class StorageManager: StorageManagerProtocol {
    func getLanguages() -> [LanguageProtocol] {
        let languages: [LanguageProtocol] = [
            Language(name: "Русский", key: "rus"),
            Language(name: "Эрзянский", key: "myv")
        ]
        
        return languages
    }
}

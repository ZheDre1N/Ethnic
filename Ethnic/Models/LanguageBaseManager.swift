//
//  LanguageBaseManager.swift
//  Ethnic
//
//  Created by user208341 on 11/13/21.
//

import Foundation

import Foundation

class LanguageBaseManager {
    
    let allLanguagesInfo:[String: [String:Any]] = [
        "rus":["fullLanguageName":"Russian",
               "sourceTextPlaceholder":"Введите текст",
               "targetTextPlaceholder":"Здесь вы получите переведенный текст"],
        "myv":["fullLanguageName":"Erzian",
               "sourceTextPlaceholder":"Сермат текст",
               "targetTextPlaceholder":"Тесэ вы саемс переведенной текстэ"],
        "eng":["fullLanguageName":"English",
               "sourceTextPlaceholder":"Enter the text",
               "targetTextPlaceholder":"Here you will get the translated text"]
    ]
    
    func getAllLanguageKeys() -> [String] {
        var keys: [String] = []
        for (key, _) in allLanguagesInfo {
            keys.append(key)
        }
        return keys
    }
    
    func getAllFullLanguageNames() -> [String] {
        let keys = getAllLanguageKeys()
        var languages: [String] = []
        for key in keys {
            guard let fullLanguageName = getFullLanguageName(forKey: key) else { continue }
            languages.append(fullLanguageName)
        }
        languages = languages.sorted() {$0 < $1}
        return languages
    }
    
    func getRecentFullLanguageNames() -> [String] {
        return ["Erzian","Russian"]
    }
    
    func getSortedFullLanguageNames(forSearchText searchText: String?) -> [String] {
        let fullLanguageNames = getAllFullLanguageNames()
        guard let safeSearchText = searchText else { return fullLanguageNames}
        if searchText == "" {
            return fullLanguageNames
        }
        var sortedFullLanguageNames:[String] = []
        for search in fullLanguageNames {
            if search.uppercased().contains(safeSearchText.uppercased()) {
                sortedFullLanguageNames.append(search)
            }
        }
        return sortedFullLanguageNames
    }
    
    func getLanguageKey(forFullLanguageName fullLanguageName: String) -> String? {
        let keys = getAllLanguageKeys()
        var fullLanguageNameAndKeyDictionary: [String:String] = [:]
        for key in keys {
            guard let fullLanguageName = getFullLanguageName(forKey: key) else { continue }
            fullLanguageNameAndKeyDictionary[fullLanguageName]=key
        }
        guard let safeLanguageKey = fullLanguageNameAndKeyDictionary[fullLanguageName] else { return nil }
        return safeLanguageKey
    }
    
    
    func getFullLanguageName(forKey key: String) -> String? {
        let languageInfo = allLanguagesInfo[key]
        guard let safeLanguageInfo = languageInfo else { return nil }
        guard let fullLanguageName = safeLanguageInfo["fullLanguageName"] else { return nil }
        let stringLanguageName = fullLanguageName as? String
        guard let safeStringLanguageName = stringLanguageName else { return nil }
        return safeStringLanguageName
    }
    
    func getSourceTextPlaceholder(forKey key: String) -> String? {
        let languageInfo = allLanguagesInfo[key]
        guard let safeLanguageInfo = languageInfo else { return nil }
        guard let sourceTextPlaceholder = safeLanguageInfo["sourceTextPlaceholder"] else { return nil }
        let stringSourceTextPlaceholder = sourceTextPlaceholder as? String
        guard let safeStringSourceTextPlaceholder = stringSourceTextPlaceholder else { return nil }
        return safeStringSourceTextPlaceholder
    }
    
    func getTargetTextPlaceholder(forKey key: String) -> String? {
        let languageInfo = allLanguagesInfo[key]
        guard let safeLanguageInfo = languageInfo else { return nil }
        guard let targetTextPlaceholder = safeLanguageInfo["targetTextPlaceholder"] else { return nil }
        let stringTargetTextPlaceholder = targetTextPlaceholder as? String
        guard let safeStringTargetTextPlaceholder = stringTargetTextPlaceholder else { return nil }
        return safeStringTargetTextPlaceholder
    }
    
}

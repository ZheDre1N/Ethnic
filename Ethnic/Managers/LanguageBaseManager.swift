//
//  LanguageBaseManager.swift
//  Ethnic
//
//  Created by user208341 on 11/13/21.
//

import Foundation

final class LanguageBaseManager {

    let base:[String:String] = [
        "rus":"Russian",
        "myv":"Erzian",
        "eng":"English"
    ]

    func getLanguageKeys() -> [String] {
        var keys: [String] = []
        for (key, _) in base {
            keys.append(key)
        }
        keys = keys.sorted() {$0 < $1}
        return keys
    }

    func getLanguageNames() -> [String] {
        var names: [String] = []
        for (_, name) in base {
            names.append(name)
        }
        names = names.sorted() {$0 < $1}
        return names
    }

    func getLanguageName(forKey key: String) -> String? {
        guard let languageName = base["\(key)"] else { return nil}
        return languageName
    }
    
    func getLanguageKey(forLanguageName languageName: String) -> String? {
        var reverseBase:[String:String] = [:]
        for (key,name) in base {
            reverseBase["\(name)"] = "\(key)"
        }
        guard let key = reverseBase["\(languageName)"] else { return nil }
        return key
    }
}

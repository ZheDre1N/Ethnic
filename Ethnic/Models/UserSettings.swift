//
//  UserSettings.swift
//  Ethnic
//
//  Created by user208341 on 11/14/21.
//

import Foundation

class UserSettings {
    var currentSourceLanguageKey = "rus"
    var currentTargetLanguageKey = "myv"
    
    func resetSettings() {
        currentSourceLanguageKey = "rus"
        currentTargetLanguageKey = "myv"
    }
}

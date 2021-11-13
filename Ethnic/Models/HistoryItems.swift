//
//  HistoryItems.swift
//  Ethnic
//
//  Created by user208341 on 11/13/21.
//

import Foundation

// Class for storing user translation history. Implemented through a singleton.
class HistoryItems {
    
    private init() {}
    static let shared = HistoryItems()
    
    var historiesArray = [HistoryItems.HistoryItem]()
    
    struct HistoryItem {
        let sourceLanguage: String
        let targetLanguage: String
        let sourceText: String
        let targetText: String
        var isFavorites: Bool
        
        init(sourceLanguage: String,targetLanguage: String, sourceText: String, targetText: String, isFavorites: Bool) {
            self.sourceLanguage = sourceLanguage
            self.targetLanguage = targetLanguage
            self.sourceText = sourceText
            self.targetText = targetText
            self.isFavorites = isFavorites
        }
    }
    
}

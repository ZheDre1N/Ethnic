//
//  APIManager.swift
//  Ethnic
//
//  Created by user208341 on 11/13/21.
//

import Foundation

class APIManager {
    
    
    static func translateText (sourceLanguage: String, targetLanguage: String, sourceText: String, completion: @escaping (_ targetText: String)->()) {
        
        // 1. Creating url
        guard let url = URL(string: "https://ethnic-translator.herokuapp.com/translate") else { return }
        
        // 2. Creating transmited data
        let sourceTextData = ["sourceLang": "\(sourceLanguage)", "targetLang": "\(targetLanguage)", "text":"\(sourceText)", "flat" : true] as [String : Any]
        
        // 3. declaration urlrequest
        var request = URLRequest(url: url)
        
        // 4. declaration headers and store method
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 5. convert userData to JSON format for transmit
        guard let httpBody = try? JSONSerialization.data(withJSONObject: sourceTextData, options: []) else { return }
        request.httpBody = httpBody
        
        // 6. creating a session
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            
            // check for not nil
            guard let data = data else { return }
            
            // 7. decode data for saving in the model
            do {
                let decodedData = try JSONDecoder().decode(APIDataModel.self, from: data)
                let targetText = decodedData.data
                
                // 8. Call completion handler to transmit data
                completion(targetText)
                self.addTranslatedTextToHistory(sourceLanguage: sourceLanguage, targetLanguage: targetLanguage, sourceText: sourceText, targetText: targetText)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
        
    static func addTranslatedTextToHistory(sourceLanguage: String, targetLanguage: String, sourceText: String,targetText: String) {
        // add new translated text to history
        let history = HistoryItems.shared
        history.historiesArray.append(HistoryItems.HistoryItem.init(sourceLanguage: "\(sourceLanguage)",
                                                                    targetLanguage: "\(targetLanguage)",
                                                                    sourceText: "\(sourceText)",
                                                                    targetText: "\(targetText)",
                                                                    isFavorites: false)
        )
    }
}

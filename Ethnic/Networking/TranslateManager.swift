import Foundation

class TranslateManager {
    
    func translateText (sourceLanguage: String, targetLanguage: String, sourceText: String, completion: @escaping (_ targetText: String)->()) {
        
        // 1. Create a url
        let url = URL(string: "https://ethnic-translator.herokuapp.com/translate")
        
        // 2. Convert data to JSON Format
        let httpBody = convertDataToJSON(
            sourceLanguage: sourceLanguage,
            targetLanguage: targetLanguage,
            sourceText: sourceText)
        
        // 2. Make a request
        let request = makeTranslateRequest(data: httpBody!, url: url!)
        NetworkService.createDataTask(request: request) { data, response, error in
            let targetText = self.decodeResponse(data: data)
            completion(targetText!)
        }
    }
    
    private func convertDataToJSON(sourceLanguage: String, targetLanguage: String, sourceText: String) -> Data? {
        let sourceTextData = [
            "sourceLang": "\(sourceLanguage)",
            "targetLang": "\(targetLanguage)",
            "text":"\(sourceText)", "flat" : true
        ] as [String : Any]
        
        let data = try? JSONSerialization.data(withJSONObject: sourceTextData)
        return data
    }
    
    private func makeTranslateRequest(data: Data, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        return request
    }
    
    private func decodeResponse(data: Data?) -> String? {
        guard let data = data else { return nil }
        let decodedData = try! JSONDecoder().decode(APIDataModel.self, from: data)
        let targetText = decodedData.data
        return targetText
    }
}

import Foundation

protocol TranslateManagerProtocol {
  func translateText(
    sourceLanguageKey: String,
    targetLanguageKey: String,
    sourceText: String,
    completionHandler: @escaping (Result<String, Error>) -> Void
  )
}

class TranslateManager: TranslateManagerProtocol {
  func translateText(
    sourceLanguageKey: String,
    targetLanguageKey: String,
    sourceText: String,
    completionHandler: @escaping (Result<String, Error>) -> Void
  ) {
    // 1. Create a url
    guard let url = URL(
      string: "https://ethnic-translator.herokuapp.com/translate"
    ) else {
      completionHandler(.failure(TranslateManagerError.createURL))
      return
    }

    // 2. Convert data to JSON Format
    guard let httpBody = convertDataToJSON(
      sourceLanguage: sourceLanguageKey,
      targetLanguage: targetLanguageKey,
      sourceText: sourceText
    ) else {
      completionHandler(.failure(TranslateManagerError.createDataTask))
      return
    }

    // 2. Create a request
    let request = makeTranslateRequest(data: httpBody, url: url)

    // 3. Create a URLSessionDataTask
    NetworkService().createDataTask(request: request) { data, _, _ in
      guard let data = data else {
        completionHandler(.failure(TranslateManagerError.createDataTask))
        return
      }

      guard let targetText = self.decodeTranslateResponse(data: data) else {
        completionHandler(.failure(TranslateManagerError.decodeData))
        return
      }
      completionHandler(.success(targetText))
    }
  }

  private func convertDataToJSON(
    sourceLanguage: String,
    targetLanguage: String,
    sourceText: String
  ) -> Data? {
    let sourceTextData = [
      "sourceLang": "\(sourceLanguage)",
      "targetLang": "\(targetLanguage)",
      "text": "\(sourceText)",
      "flat": true
    ] as [String: Any]

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

  private func decodeTranslateResponse(data: Data) -> String? {
    guard let decodedData = try? JSONDecoder().decode(APIDataModel.self, from: data) else { return nil }
    let targetText = decodedData.data
    return targetText
  }
}

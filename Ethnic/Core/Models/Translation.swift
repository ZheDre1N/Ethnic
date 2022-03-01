import Foundation

protocol TranslationProtocol {
  var sourceLanguage: Language { get }
  var targetLanguage: Language { get }
  var sourceText: String { get }
  var targetText: String { get }
  var date: Date { get }
  var isFavourite: Bool { get set }
}

struct Translation: TranslationProtocol {
  var sourceLanguage: Language
  var targetLanguage: Language
  var sourceText: String
  var targetText: String
  var date: Date
  var isFavourite: Bool
}

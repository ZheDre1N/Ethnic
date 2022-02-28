import Foundation

protocol LanguageProtocol {
  var name: String { get }
  var key: String { get }
}

struct Language: LanguageProtocol {
  var name: String
  var key: String
}

import Foundation

protocol HistoryProtocol {
  var history: [Translation] { get set }
}

struct History: HistoryProtocol {
  var history: [Translation] = []
}

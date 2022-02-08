import Foundation

class NetworkService {
    
    static func createDataTask(
        request: URLRequest,
        configuration: URLSessionConfiguration,
        completion: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        let urlSession = URLSession.init(configuration: configuration)
        let task = urlSession.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
    
    static func createDataTask(
        request: URLRequest,
        completion: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
}

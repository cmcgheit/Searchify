//
//  Made with ❤ and ☕ 
//

import Foundation

enum APIError: Error {
    case noData, malformedData, unknown
}

class DataTaskMock: URLSessionDataTask {
    
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    var hasStarted = false
    var testData: Data?
    var testError: APIError?
    
    init(with completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.completionHandler = completionHandler
    }
    override func resume() {
        hasStarted = true
        completionHandler(testData,nil,testError)
    }
}

class URLSessionMock: URLSessionProtocol {
    
    var lastURL: URL?
    var dataTask: DataTaskMock?
    var testData: Data?
    var testError: APIError?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = url
        let dataTask = DataTaskMock(with: completionHandler)
        self.dataTask = dataTask
        self.dataTask?.testData = testData
        self.dataTask?.testError = testError
        return dataTask
    }
}

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
}

class Music {
    var url: URL
    var songs = ""
    
    init(with url: URL) {
        self.url = url
    }
    
    func fetch(with urlSession: URLSessionProtocol = URLSession.shared, completionHandler: @escaping () -> Void) {
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.songs = String(decoding: data, as: UTF8.self)
            }
            completionHandler()
        }
        task.resume()
    }
}

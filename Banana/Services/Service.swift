//
// Service.swift
//

import Foundation

enum ServiceError: Error, CustomNSError {
    
    case dataIsNil
    case decodingData
    
    static var errorDomain: String {
        return "SeriveErrorDomain"
    }
    
    var errorCode: Int {
        switch self {
        case .dataIsNil:
            return -1
        case .decodingData:
            return -2
        }
    }
    
    var errorUserInfo: [String : Any] {
        var string: String
        switch self {
        case .dataIsNil:
            string = "Data is nil"
        case .decodingData:
            string = "Can't decode data"
        }
        return [NSLocalizedDescriptionKey: string]
    }
}

class Service {
    
    static func fetchHtmlText(with url: URL, _ block: @escaping (_ result: Result<String, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("text/html", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    block(.failure(error))
                    return
                }
                if data == nil {
                    block(.failure(ServiceError.dataIsNil))
                    return
                }
                if let string = String(data: data!, encoding: .utf8) {
                    block(.success(string))
                    return
                }
                block(.failure(ServiceError.decodingData))
            }
        }.resume()
    }
}

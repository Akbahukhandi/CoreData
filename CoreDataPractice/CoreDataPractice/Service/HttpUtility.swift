//
//  HttpUtility.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//

import Foundation

struct HttpUtility {
    
    func getApiData<T: Decodable>(urlRequest: URL, username: String, password: String, resultType: T.Type, completionHandler: @escaping(Result<T, Error>?) -> Void) {
        var request = createAuthenticatedRequest(url: urlRequest, username: username, password: password)
        request.addValue("sb_2024", forHTTPHeaderField: "X-API-KEY")
        request.addValue("Basic YWRtaW46MTIzNA==", forHTTPHeaderField: "Authorization")
        request.addValue("ci_session=q1bsi5tqneofnknkdiqqok5aom5tagcs", forHTTPHeaderField: "Cookie")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "DataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completionHandler(.failure(error))
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: data)
                completionHandler(.success(result))
            } catch let error {
                completionHandler(.failure(error))
                debugPrint("Error occurred while decoding: \(error.localizedDescription)")
            }
        }.resume()
    }

    // Creates a URLRequest with Basic Authentication headers.
    func createAuthenticatedRequest(url: URL, username: String, password: String) -> URLRequest {
        var request = URLRequest(url: url)
        let credentials = "\(username):\(password)"
        guard let credentialsData = credentials.data(using: .utf8) else {
            fatalError("Failed to encode credentials")
        }
        let base64Credentials = credentialsData.base64EncodedString()
        request.addValue("Basic \(base64Credentials)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}

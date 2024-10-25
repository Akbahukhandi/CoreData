//
//  SubjectApiRepository.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//

import Foundation
 
struct SubjectApiRepository {
    func getApiData(username: String, password: String, completion: @escaping (_ result: [SubjectModel]?) -> Void) {
        
        let url = URL(string: "http://192.168.1.56/api/subjects")!
        let httpUtilty = HttpUtility()
        httpUtilty.getApiData(urlRequest: url, username: username, password: password, resultType: [SubjectModel].self) { result in
            switch result {
            case .success(let subjects):
                completion(subjects)
            case .failure(let error):
                print(error)
                completion(nil)
            case .none:
                completion(nil)
            }
        }
    }
}

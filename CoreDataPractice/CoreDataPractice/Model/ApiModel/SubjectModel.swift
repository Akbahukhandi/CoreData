//
//  SubjectModel.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//

import Foundation
struct SubjectModel: Codable{
    
    let subID, subName, subLogo: String

    enum CodingKeys: String, CodingKey {
        case subID = "sub_id"
        case subName = "sub_name"
        case subLogo = "sub_logo"
    }
}

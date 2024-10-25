//
//  CDAnimalExtension.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//

import Foundation

extension CDSubjects {
    func convertToSubjects() -> SubjectModel {
        return SubjectModel(subID: self.sub_id!, subName: self.sub_id!, subLogo: self.sub_logo!)
    }
}

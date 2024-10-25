//
//  SubjectViewModel.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//

import Foundation

struct SubjectViewModel {
    private let subjectApiRepository: SubjectApiRepository = SubjectApiRepository()
    private let subjectDatRepository: SubjectDataRepository = SubjectDataRepository()
    func getAllSubject(username: String, password: String, completionHandler:@escaping(_ result: [SubjectModel]?)-> Void) {
        
        subjectDatRepository.getSubjects { subject in
            if (subject != nil && subject.count != 0) {
                completionHandler(subject)
            } else {
                subjectApiRepository.getApiData(username: username, password: password) { subject in
                    if (subject != nil &&  subject?.count != 0) {
                        _ = subjectDatRepository.insertSubjets(subject: subject ?? [])
                        completionHandler(subject)
                    }
                }
            }
        }
    }
}

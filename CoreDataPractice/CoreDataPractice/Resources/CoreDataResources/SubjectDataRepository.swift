//
//  AnimalDataRepository.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//

import Foundation
import CoreData

struct SubjectDataRepository {
    func insertSubjets(subject: [SubjectModel]) -> Bool {
        
        PersistentStorage.shared.persistentContainer.performBackgroundTask { privateManagedContext in
            for subject in subject {
                let cdSubject = CDSubjects(context: privateManagedContext)
                cdSubject.sub_id = subject.subID
                cdSubject.sub_logo = subject.subLogo
                cdSubject.sub_name = subject.subName
            }
            if(privateManagedContext.hasChanges){
                try? privateManagedContext.save()
                debugPrint("AnimalDataRepository: Insert record operation is completed")
            }
        }
        return true
    }
    
    func getSubjects(completion: @escaping (_ result: [SubjectModel]) -> Void) {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDSubjects.self)
        var subjects: [SubjectModel] = []
        result?.forEach({ (cdSubject) in
            subjects.append(cdSubject.convertToSubjects())
        })
        completion(subjects)
    }
}

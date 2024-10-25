//
//  CDSubjects+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//
//

import Foundation
import CoreData


extension CDSubjects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDSubjects> {
        return NSFetchRequest<CDSubjects>(entityName: "CDSubjects")
    }

    @NSManaged public var sub_id: String?
    @NSManaged public var sub_name: String?
    @NSManaged public var sub_logo: String?

}

extension CDSubjects : Identifiable {

}

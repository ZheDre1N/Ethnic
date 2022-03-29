//
//  Company+CoreDataProperties.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 28.03.2022.
//
//

import Foundation
import CoreData


extension Company {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
    return NSFetchRequest<Company>(entityName: "Company")
  }

  @NSManaged public var name: String?
  @NSManaged public var employee: User?
}

extension Company : Identifiable {}

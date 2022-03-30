//
//  LanguageMO+CoreDataProperties.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 30.03.2022.
//
//

import Foundation
import CoreData

extension LanguageMO {
  @nonobjc
  public class func fetchRequest() -> NSFetchRequest<LanguageMO> {
    return NSFetchRequest<LanguageMO>(entityName: "Language")
  }

  @NSManaged public var key: String?
  @NSManaged public var name: String?
}

extension LanguageMO: Identifiable {
}

//
//  TranslationMO+CoreDataProperties.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 30.03.2022.
//
//

import Foundation
import CoreData

extension TranslationMO {
  @nonobjc
  public class func fetchRequest() -> NSFetchRequest<TranslationMO> {
    return NSFetchRequest<TranslationMO>(entityName: "Translation")
  }

  @NSManaged public var date: Date?
  @NSManaged public var isFavourite: Bool
  @NSManaged public var sourceText: String?
  @NSManaged public var targetText: String?
  @NSManaged public var sourceLanguage: LanguageMO?
  @NSManaged public var targetLanguage: LanguageMO?
}

extension TranslationMO: Identifiable {
}

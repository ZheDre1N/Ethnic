//
//  CoreDataManager.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 28.03.2022.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
  func saveTranslation(translation: Translation)
  func getTranslationHistory() -> [TranslationMO]?
  func removeTranslationHistory()
}

class CoreDataManager {
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Ethnic")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext

  // MARK: - Core Data Saving support
  private func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }

  public func saveTranslate(translation: Translation) {
    let sourceLanguageMO = LanguageMO(context: viewContext)
    sourceLanguageMO.key = translation.sourceLanguage.key
    sourceLanguageMO.name = translation.sourceLanguage.name

    let targetLanguageMO = LanguageMO(context: viewContext)
    targetLanguageMO.key = translation.targetLanguage.key
    targetLanguageMO.name = translation.targetLanguage.name

    let translationMO = TranslationMO(context: viewContext)
    translationMO.sourceText = translation.sourceText
    translationMO.targetText = translation.targetText
    translationMO.date = translation.date
    translationMO.isFavourite = translation.isFavourite
    translationMO.targetLanguage = targetLanguageMO
    translationMO.sourceLanguage = sourceLanguageMO
    saveContext()
  }

  public func getTranslationHistory() -> [TranslationMO]? {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Translation")

    if let translations = try? viewContext.fetch(fetchRequest) as? [TranslationMO] {
      return translations
    } else {
      return nil
    }
  }

  func updateUser(with name: String) {
//    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//    fetchRequest.predicate = NSPredicate(format: "isMain = true")
//
//    if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {
//      guard let mainUser = users.first else { return }
//      mainUser.name = name
//    }
//
//    try? viewContext.save()
  }

  public func removeTranslationHistory() {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Translation")
    if let translations = try? viewContext.fetch(fetchRequest) as? [TranslationMO] {
      translations.forEach { viewContext.delete($0) }
      try? viewContext.save()
    }
  }
}

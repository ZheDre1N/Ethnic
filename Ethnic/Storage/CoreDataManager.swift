//
//  CoreDataManager.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 28.03.2022.
//

import Foundation
import CoreData

class CoreDataManager {
  // MARK: - Core Data stack
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Ethnic")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  lazy var viewContext: NSManagedObjectContext = {
    return persistentContainer.viewContext
  }()

  // MARK: - Core Data Saving support
  func saveContext () {
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

  func getMainUser() -> User {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "isMain = true")

    if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {
      return users.first!
    } else {
      let company = Company(context: viewContext)
      company.name = "Apple"
      let user = User(context: viewContext)
      user.name = "ZheDre1N"
      user.age = 26
      user.company = company
      user.isMain = true
      user.anyBool = NSNumber(booleanLiteral: false)
      do {
        try viewContext.save()
      } catch {
        print(error.localizedDescription)
      }
      return user
    }
  }

  func updateUser(with name: String) {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "isMain = true")

    if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {
      guard let mainUser = users.first else { return }
      mainUser.name = name
    }

    try? viewContext.save()
  }

  func removeMainUser() {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "isMain = true")

    if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {
      guard let mainUser = users.first else { return }
      viewContext.delete(mainUser)
      try? viewContext.save()
    }
  }
}

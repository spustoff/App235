//
//  MainViewModel.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI
import CoreData

final class MainViewModel: ObservableObject {
    
    @AppStorage("rooms") var rooms: [String] = []
    
    @Published var name_room: String = ""
    
    @Published var isAddRoom: Bool = false
    @Published var isAddPurchase: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var name_purchase: String = ""
    @Published var cost_purchase: String = ""
    @Published var date_purchase: Date = Date()
    
    @Published var purchases: [PurchaseModel] = []

    @Published var selected_room: String = ""
    
    func fetchPurchases(room_name: String) {
        
        CoreDataStack.shared.modelName = "PurchaseModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PurchaseModel>(entityName: "PurchaseModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.purchases = branch.filter{$0.room_name == room_name}
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.purchases = []
        }
    }
    
    func addPurchase(room_name: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "PurchaseModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "PurchaseModel", into: context) as! PurchaseModel
        
        trans.name = name_purchase
        trans.date = date_purchase
        trans.room_name = room_name
        trans.cost = Int16(cost_purchase) ?? 0
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}

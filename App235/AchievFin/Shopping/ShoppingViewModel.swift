//
//  ShoppingViewModel.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI
import CoreData

final class ShoppingViewModel: ObservableObject {
    
    @Published var shoppings: [ShoppingModel] = []
    @Published var isAdd: Bool = false
    
    @Published var room_name: String = ""
    @Published var purchase_name: String = ""
    @Published var quantity: String = ""
    
    @AppStorage("completed_shoppings") var completed_shoppings: [String] = []
    
    func fetchPlans() {
        
        CoreDataStack.shared.modelName = "ShoppingModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ShoppingModel>(entityName: "ShoppingModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.shoppings = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.shoppings = []
        }
    }
    
    func addPlan(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "ShoppingModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "ShoppingModel", into: context) as! ShoppingModel
        
        trans.room_name = room_name
        trans.purchase_name = purchase_name
        trans.quantity = Int16(quantity) ?? 0
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}

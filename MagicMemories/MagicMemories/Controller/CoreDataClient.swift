//
//  CoreDataClient.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 14/03/2022.
//

import Foundation
import UIKit
import CoreData

class CoreDataClient
{
    // Singleton
    static let shareInstance = CoreDataClient()
    
    let context = (UIApplication.shared.delegate as! AppDelegate) .persistentContainer.viewContext
    
    func fetchAllPhotos() -> [Photo] {
        var fetchResults = [Photo]()
        
        //NSFetchRequest is a generic class. It is a description of search criteria used to retrieve data from a presistent store.
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        
        do {
            fetchResults = try context.fetch(fetchRequest) as! [Photo]
        }
        catch {
            print("Error while fetching the photo. \(error.localizedDescription)")
        }
        
        return fetchResults
    }
    
    func savePhoto(imageData: Data) {
        let photoInstance = Photo(context: context)
        photoInstance.image = imageData
        photoInstance.date = Date()
        
        do {
            try context.save()
        }
        catch {
            print("Error while saving the Photo. \(error.localizedDescription)")
        }
    }
    
    func deletePhoto(photo: Photo) {
        context.delete(photo)
        
        do {
            try context.save()
        }
        catch {
            
        }
    }
}

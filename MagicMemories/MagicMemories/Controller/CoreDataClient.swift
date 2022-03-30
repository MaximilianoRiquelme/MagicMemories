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
    //Singleton
    static let shareInstance = CoreDataClient()
    
    let context = (UIApplication.shared.delegate as! AppDelegate) .persistentContainer.viewContext
    
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
    
    func fetchPhotos() -> [Photo] {
        var fetchResult = [Photo]()
        
        //NSFetchRequest is a generic class. It is a description of search criteria used to retrieve data from a presistent store.
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        
        do {
            fetchResult = try context.fetch(fetchRequest) as! [Photo]
        }
        catch {
            print("Error while fetching the photo. \(error.localizedDescription)")
        }
        
        return fetchResult
    }
}

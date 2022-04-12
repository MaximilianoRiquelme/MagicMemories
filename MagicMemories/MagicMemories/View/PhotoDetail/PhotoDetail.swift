//
//  PhotoDetail.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 17/03/2022.
//

import UIKit
import CoreData

class PhotoDetail: UIViewController
{
    var callback : (() -> Void)?
    var photo: Photo?
    var deleteButton: UIBarButtonItem?
    
    @IBOutlet var photoImage: UIImageView!
    
    
    init(photo: Photo) {
        super.init(nibName: "PhotoDetail", bundle: nil)
        self.photo = photo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteThisPhoto))
        self.navigationItem.rightBarButtonItem = deleteButton
        
        if let image = photo?.image! {
            photoImage.image = UIImage(data: image)
        }
        
        if let photoDate = photo?.date! {
            self.title = photoDate.formatted()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        callback?()
    }
    
    @objc func deleteThisPhoto() {
        if let thisPhoto = self.photo {
            CoreDataClient.shareInstance.deletePhoto(photo: thisPhoto)
            navigationController?.popViewController(animated: true)
        }
    }
}

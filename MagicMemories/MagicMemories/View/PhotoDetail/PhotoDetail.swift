//
//  PhotoDetail.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 17/03/2022.
//

import UIKit

class PhotoDetail: UIViewController
{
    var photo: Photo?
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var navBar: UINavigationBar!
    
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
        if let image = photo?.image! {
            photoImage.image = UIImage(data: image)
        }
        
        if let photoDate = photo?.date! {
            self.title = photoDate.formatted()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  Camera.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 10/03/2022.
//

import UIKit

class Camera: UIViewController
{
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet var pickPhotoButton: UIButton!
    @IBOutlet var savePhotoButton: UIButton!
    @IBOutlet var goToGalleryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Magic Memories"
        // Do any additional setup after loading the view.
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .secondarySystemBackground
         
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.compactAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationController?.navigationBar.compactScrollEdgeAppearance = navBarAppearance
    }

    @IBAction func didPickPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true)
    }
    
    @IBAction func didSavePhoto(_ sender: Any) {
        if let imageData = self.cameraImageView.image?.pngData() {
            CoreDataClient.shareInstance.savePhoto(imageData: imageData)
        }
    }
    
    @IBAction func didGoToGallery(_ sender: Any) {
        let gallery = Gallery()
        
        if let navController = self.navigationController
        {
            navController.modalPresentationStyle = .fullScreen
            navController.pushViewController(gallery, animated: true)
        }
    }
}

extension Camera: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        else {
            return
        }
        
        cameraImageView.image = image
    }
}

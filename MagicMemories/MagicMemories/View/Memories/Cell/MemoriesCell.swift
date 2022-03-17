//
//  MemoriesCell.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 16/03/2022.
//

import UIKit

class MemoriesCell: UICollectionViewCell
{
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .tertiarySystemBackground
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func restoreCell() {
        self.photoImage.image = nil
    }
        
    func updateCell(photo: Photo) {
        photoImage.image = UIImage(data: photo.image!)
        activityIndicator.stopAnimating()
    }
}

//
//  Memories.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 15/03/2022.
//

import UIKit

class Memories: UICollectionViewController
{
    private let cellIdentifier: String = "MemoriesCell"
    var fetchedPhotos: [Photo]?
    
    init(cellSize: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: cellSize-4, height: cellSize-4)
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 1
        super.init(collectionViewLayout: layout)
        self.title = "Memories"
        tabBarItem.image = UIImage(systemName: "photo.on.rectangle")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .secondarySystemBackground
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        // Do any additional setup after loading the view.
        fetchedPhotos = CoreDataClient.shareInstance.fetchPhotos()
        self.collectionView.reloadData()
    }
    
    /*
    // MARK: UICollectionViewDataSource
    */
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fetchedPhotos?.count ?? .zero
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MemoriesCell
        else {
            return MemoriesCell()
        }
    
        // Configure the cell
        cell.restoreCell()
        
        cell.updateCell(photo: (fetchedPhotos?[indexPath.item])!)
    
        return cell
    }
    
    /*
    // MARK: UICollectionViewDelegate
    */
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoDetail = PhotoDetail(photo: (fetchedPhotos?[indexPath.item])!)
        
        if let navController = self.navigationController
        {
            navController.modalPresentationStyle = .fullScreen
            navController.pushViewController(photoDetail, animated: true)
        }
    }
}

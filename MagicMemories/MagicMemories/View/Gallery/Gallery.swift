//
//  Gallery.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 10/03/2022.
//

import UIKit

class Gallery: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gallery"
        // Do any additional setup after loading the view.
        let tabs = [Memories(cellSize: self.view.frame.width/2),
                    Map(),
                    Albums()]
        
        self.setViewControllers(tabs, animated: true)
        
        self.tabBar.unselectedItemTintColor = .white
        self.tabBar.backgroundColor = .tertiarySystemBackground
    }
}

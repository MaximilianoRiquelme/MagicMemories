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
        
        // Sets up the views.
        let tabs = [Memories(cellSize: self.view.frame.width/2),
                    Map(),
                    Albums()]
        self.setViewControllers(tabs, animated: true)
        
        
        //Sets up the tabBar appearance.
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .tertiarySystemBackground
        
        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}

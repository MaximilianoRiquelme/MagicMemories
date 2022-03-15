//
//  Map.swift
//  MagicMemories
//
//  Created by Maximiliano Riquelme Vera on 15/03/2022.
//

import UIKit

class Map: UIViewController {
    
    init() {
        super.init(nibName: "Map", bundle: nil)
        self.title = "Map"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        // Do any additional setup after loading the view.
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

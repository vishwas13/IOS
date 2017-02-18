//
//  DetailViewController.swift
//  Project ios
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var Proj : Scary?
    @IBOutlet weak var UDescription: UILabel!
    @IBOutlet weak var USubtitle: UILabel!
    @IBOutlet weak var UName: UILabel!
    @IBOutlet weak var UImage: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UDescription.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        UDescription.layer.borderWidth = 1.0;
        UDescription.layer.cornerRadius = 5.0;
        UName.text = Proj?.Name
        UDescription.text = Proj?.Description
        UImage.image = Proj?.Picture
        USubtitle.text = Proj?.Subtitle
        
     

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

}

}

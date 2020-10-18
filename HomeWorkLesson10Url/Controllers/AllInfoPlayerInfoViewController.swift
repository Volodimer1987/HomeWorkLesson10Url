//
//  AllInfoPlayerInfoViewController.swift
//  HomeWorkLesson10Url
//
//  Created by vladimir gennadievich on 15.10.2020.
//

import UIKit

class AllInfoPlayerInfoViewController: UIViewController {
    
    var nameSername:String!
    var teamLabelText:String!
    var shirtNumberText:Int!
    var imagePlayer:UIImage!

    @IBOutlet var nameSernameLabel: UILabel!
    @IBOutlet var teamLabel: UILabel!
    @IBOutlet var shirtNumberLabel: UILabel!
    @IBOutlet var photoPlayerOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSernameLabel.text = nameSername
        teamLabel.text = "Игрок команды:" + " " + teamLabelText
        shirtNumberLabel.text = "Номер: \(shirtNumberText ??  0)"
        photoPlayerOutlet.image = imagePlayer
        
    }

}

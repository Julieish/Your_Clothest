//
//  MainViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var rcmdBtn: UIButton!
    @IBOutlet weak var closetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rcmdBtn.layer.borderColor = UIColor.black.cgColor
        rcmdBtn.layer.borderWidth = 2
        closetBtn.layer.borderColor = UIColor.black.cgColor
        closetBtn.layer.borderWidth = 2
    }
    

   

}

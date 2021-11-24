//
//  SelectViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit

class SelectViewController: UIViewController {
    
    var btnSelected: [Bool] = [false, false, false, false, false, false]
    var selectedClothes = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapClothesBtn(_ sender: UIButton) {
        if !btnSelected[sender.tag] {
            sender.tintColor = .systemBlue
            selectedClothes += 1
        } else {
            sender.tintColor = .black
            selectedClothes -= 1
        }
        btnSelected[sender.tag] = !btnSelected[sender.tag]
        
    }
    
    @IBAction func tapChooseColorbtn(_ sender: UIButton) {
        if selectedClothes < 2 {
            let ac = UIAlertController(title: "Selection Insufficient", message: "Select at least two elements!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(ac, animated: true, completion: nil)
        }
        else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ColorViewController") as! ColorViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

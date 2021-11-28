//
//  SelectViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit

class SelectViewController: UIViewController {
    //hat, top, bottoms, bag, dress, shoes
    var btnSelected: [Bool] = [false, false, false, false, false, false]
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    
    var btnArr = [UIButton]()
    var selectedClothes = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        btnArr = [btn1, btn2, btn3, btn4, btn5, btn6]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapClothesBtn(_ sender: UIButton) {
        if btnSelected[sender.tag] {
            selectedClothes -= 1
            sender.tintColor = .black
            btnSelected[sender.tag] = !btnSelected[sender.tag]
        }
        else if selectedClothes == 0 {
            if !btnSelected[sender.tag] {
                sender.tintColor = .systemBlue
                selectedClothes += 1
                btnSelected[sender.tag] = !btnSelected[sender.tag]
            }
        } else if selectedClothes == 1 {
            if !btnSelected[sender.tag] {
                sender.tintColor = .systemPink
                selectedClothes += 1
                btnSelected[sender.tag] = !btnSelected[sender.tag]
            } else {
                
            }
        }
    }
    
    @IBAction func tapResetBtn(_ sender: UIButton) {
        for i in 0..<6 {
            btnArr[i].tintColor = .black
            selectedClothes = 0
            btnSelected[i] = false
        }
    }
    @IBAction func tapChooseColorbtn(_ sender: UIButton) {
        if selectedClothes < 2 {
            let ac = UIAlertController(title: "Selection Insufficient", message: "Select two elements!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(ac, animated: true, completion: nil)
        }
        else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ColorViewController") as! ColorViewController
            vc.selectedClothes = self.btnSelected
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

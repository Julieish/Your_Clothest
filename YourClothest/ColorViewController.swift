//
//  ColorViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit
import UIImageColors

protocol SecondaryDeleagte {
    func setSecondaryImage(_ img: UIImage)
}

class ColorViewController: UIViewController, ColorSetDelegate, SecondaryDeleagte {
    
    @IBOutlet weak var btn1left: UIButton!
    @IBOutlet weak var btn2left: UIButton!
    @IBOutlet weak var btn3left: UIButton!
    @IBOutlet weak var btn4left: UIButton!
    
    @IBOutlet weak var btn1right: UIButton!
    @IBOutlet weak var btn2right: UIButton!
    @IBOutlet weak var btn3right: UIButton!
    @IBOutlet weak var btn4right: UIButton!
    
    @IBOutlet weak var secondaryBtn: UIButton!
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    //hat, top, bottoms, bag, dress, shoes
    var selectedClothes: [Bool] = [false, false, false, false, false, false]
    let ImageName = ["hat", "shirts", "pants", "bag", "dress", "shoes"]
    var firstImgIdx = 0
    var secondImgIdx = 0
    var isColorRecommended = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        topImageView.image = UIImage(named: ImageName[firstImgIdx])
        topImageView.tintColor = .black
        bottomImageView.image = UIImage(named: ImageName[secondImgIdx])
        bottomImageView.tintColor = .black
        secondaryBtn.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isColorRecommended {
            
        }
    }
    
    @IBAction func tapComboBtn(_ sender: UIButton) {
        var color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let bottomImg = UIImage(named: ImageName[secondImgIdx] + "_filled")
        switch sender.tag {
        case 1 :
            color = btn1right.backgroundColor!
            break
        case 2:
            color = btn2right.backgroundColor!
            break
        case 3:
            color = btn3right.backgroundColor!
            break
        case 4:
            color = btn4right.backgroundColor!
            break
        default:
            break
        }
        bottomImageView.image = bottomImg
        bottomImageView.tintColor = color
    }
    
    @IBAction func tapSelectBtn(_ sender: UIButton) {
        //이미지 없으면 alert 뜨게 하기
        let vc = ImageCollectionViewController()
        vc.clothesIdx = firstImgIdx
        vc.colorSetDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setColor(_ color: UIImageColors, _ img: UIImage) {
        isColorRecommended = true
        topImageView.image = img
        topImageView.tintColor = color.primary!
        btn1left.backgroundColor = color.primary!
        btn2left.backgroundColor = color.primary!
        btn3left.backgroundColor = color.primary!
        btn4left.backgroundColor = color.primary!
        
        btn1right.backgroundColor = .black
        btn2right.backgroundColor = UIColor(red: 80/256, green: 80/256, blue: 80/256, alpha: 1)
        btn3right.backgroundColor = UIColor(red: 86/256, green: 79/256, blue: 54/256, alpha: 1)
        btn4right.backgroundColor = UIColor(red: 50/256, green: 118/256, blue: 255/256, alpha: 1)
        secondaryBtn.isEnabled = true
    }

    @IBAction func tapSecondarySelectionBtn(_ sender: UIButton) {
        let vc = SecondarySelectionViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setSecondaryImage(_ img: UIImage) {
        bottomImageView.image = img
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

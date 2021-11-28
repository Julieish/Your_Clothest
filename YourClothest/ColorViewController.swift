//
//  ColorViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    //hat, top, bottoms, bag, dress, shoes
    var selectedClothes: [Bool] = [false, false, false, false, false, false]
    let ImageName = ["hat", "shirts", "pants", "bag", "dress", "shoes"]
    var firstImgIdx = 0
    var secondImgIdx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        firstImgIdx = selectedClothes.firstIndex(where: { $0 == true })!
        secondImgIdx = selectedClothes.lastIndex(where: { $0 == true })!
        topImageView.image = UIImage(named: ImageName[firstImgIdx])
        topImageView.tintColor = .black
        bottomImageView.image = UIImage(named: ImageName[secondImgIdx])
        bottomImageView.tintColor = .black
    }
    
    @IBAction func tapSelectBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ClothesCollection") as! ClothesCollectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

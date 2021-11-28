//
//  ColorViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit
import UIImageColors

class ColorViewController: UIViewController, ColorSetDelegate {
    
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
        let vc = ImageCollectionViewController()
        vc.clothesIdx = firstImgIdx
        vc.colorSetDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setColor(_ color: UIImageColors) {
        let img = UIImage(named: ImageName[firstImgIdx] + "_filled")
        topImageView.image = img
        topImageView.tintColor = color.primary!
    }

}

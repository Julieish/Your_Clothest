//
//  ImageCollectionViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/28.
//

import UIKit
import UIImageColors

protocol ColorSetDelegate {
    func setColor(_ color: UIImageColors)
}

protocol PopDelegate {
    func popToPrevious(_ color: UIImageColors)
}

class ImageCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PopDelegate {
    
    var colorSetDelegate: ColorSetDelegate?
    var clothesIdx = 0
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumLineSpacing = 2
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(customCollectionViewCell.self, forCellWithReuseIdentifier: customCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ad!.clothes![clothesIdx].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell.identifier, for: indexPath) as? customCollectionViewCell else { fatalError() }
        cell.btn.setBackgroundImage(ad!.clothes![clothesIdx][indexPath.row], for: .normal)
        cell.popDelegate = self
        return cell
    }
    
    func popToPrevious(_ color: UIImageColors) {
        colorSetDelegate?.setColor(color)
        self.navigationController?.popViewController(animated: true)
    }
}

class customCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    var extractedColor: UIImageColors?
    var popDelegate: PopDelegate?
    
    let btn: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleAspectFit
        btn.clipsToBounds = true
        btn.frame.size.width = 90
        btn.frame.size.height = 90
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btn.frame = contentView.bounds
    }
    
    @objc func tapBtn() {
        extractedColor = btn.currentBackgroundImage?.getColors()
        popDelegate?.popToPrevious(extractedColor!)
    }
}

//
//  SecondarySelectionViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/30.
//

import UIKit

protocol PopToParentDelegate {
    func popToParent()
}

class SecondarySelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, PopToParentDelegate {
    
    var delegate: SecondaryDeleagte?

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SecondCustomCollectionViewCell.self, forCellWithReuseIdentifier: SecondCustomCollectionViewCell.identifier)
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCustomCollectionViewCell.identifier, for: indexPath) as? SecondCustomCollectionViewCell else { fatalError() }
        cell.btn.setBackgroundImage(UIImage(named: "pants1"), for: .normal)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func popToParent() {
        delegate?.setSecondaryImage(UIImage(named: "pants1")!)
        navigationController?.popViewController(animated: true)
    }

}

class SecondCustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "SecondCollectionViewCell"
    var delegate: PopToParentDelegate?
    let btn: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleAspectFit
        btn.clipsToBounds = true
        btn.frame.size.width = 90
        btn.frame.size.height = 90
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btn.frame = contentView.bounds
    }
    
    @objc func tapBtn() {
        delegate?.popToParent()
    }
}

//
//  ClosetViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit
import Photos
import PhotosUI

class ClosetViewController: UIViewController, updateDataDelegate {

    @IBOutlet weak var tableView: UITableView!
    let clothesArr = ["Hat", "Top", "Bottoms", "Bags", "Dresses", "Shoes"]
    var images = [[UIImage]]()
    var hats: [UIImage] = [UIImage(named: "hat1")!, UIImage(named: "hat2")!, UIImage(named: "hat3")!, UIImage(named: "hat4")!]
    var tops: [UIImage] = [UIImage(named: "top1")!, UIImage(named: "top2")!, UIImage(named: "top3")!, UIImage(named: "top4")!, UIImage(named: "top5")!]
    var bottoms: [UIImage] = [UIImage(named: "pants1")!,UIImage(named: "pants2")!,UIImage(named: "pants3")!,UIImage(named: "pants4")!]
    var bags: [UIImage] = [UIImage(named: "bag1")!,UIImage(named: "bag2")!,UIImage(named: "bag3")!]
    var dresses: [UIImage] = [UIImage(named: "dress1")!,UIImage(named: "dress2")!,UIImage(named: "dress3")!,UIImage(named: "dress4")!]
    var shoes: [UIImage] = [UIImage(named: "shoes1")!,UIImage(named: "shoes2")!]
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if(!ad!.isOpen) {
            images = [hats, tops, bottoms, bags, dresses, shoes]
            ad?.clothes = images
            ad?.isOpen = true
        } else {
            images = ad!.clothes!

            self.tableView.reloadData()
        }
    }
    
    func updateData(idx: Int, data: [UIImage]) {
        self.images[idx] = data
        ad?.clothes = self.images
    }
}

extension ClosetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.idx = indexPath.row
        cell.delegate = self
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        cell.imageArr = images[indexPath.row]
        cell.cellLbl.text = clothesArr[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

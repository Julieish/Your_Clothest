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
    let clothesArr = ["Hat", "Bag", "Tops", "Dresses", "Bottoms", "Shoes"]
    var images = [[UIImage]]()
    var hats = [UIImage]()
    var tops = [UIImage]()
    var bottoms = [UIImage]()
    var bags = [UIImage]()
    var dresses = [UIImage]()
    var shoes = [UIImage]()
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if(!ad!.isOpen) {
            images = [hats, tops, bottoms, bags, dresses, shoes]
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
        cell.updateCell()
        cell.imageArr = images[indexPath.row]
        cell.cellLbl.text = clothesArr[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

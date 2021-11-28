//
//  ClosetViewController.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/24.
//

import UIKit
import Photos
import PhotosUI

class ClosetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let clothesArr = ["Hat", "Bag", "Tops", "Dresses", "Bottoms", "Shoes"]
    var images = ["hat", "hat", "hat", "hat", "hat"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ClosetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.updateCell()
        cell.cellLbl.text = clothesArr[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

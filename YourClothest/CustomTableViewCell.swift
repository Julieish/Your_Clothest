//
//  CustomTableViewCell.swift
//  YourClothest
//
//  Created by 수현 on 2021/11/27.
//

import UIKit
import Photos
import PhotosUI

protocol updateDataDelegate {
    func updateData(idx: Int, data: [UIImage])
}

class CustomTableViewCell: UITableViewCell, PHPickerViewControllerDelegate {
    var delegate: updateDataDelegate?
    var idx = -1
    var imageArr = [UIImage]()
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapAddBtn(_ sender: UIButton) {
        let alertControl = UIAlertController(title: "Add Data", message: "", preferredStyle: .actionSheet)
        alertControl.addAction(UIAlertAction(title: "Camera", style: .default, handler: runCamera(_:)))
        alertControl.addAction(UIAlertAction(title: "Gallery", style: .default, handler: presentPickerView(_:)))
        alertControl.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.window?.rootViewController?.present(alertControl, animated: true, completion: nil)
    }
    
    func presentPickerView(_ action: UIAlertAction) {
        var config = PHPickerConfiguration()
        config.filter = PHPickerFilter.images
        config.selectionLimit = 5
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        self.window?.rootViewController?.present(picker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        for item in results {
            item.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    self.imageArr.append(image as! UIImage)
                    self.delegate?.updateData(idx: self.idx, data: self.imageArr)
                    self.window?.rootViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for i in 0..<imageArr.count {
            let imageView = UIImageView()
            imageView.image = imageArr[i]
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFit
            let xPos = 130 * CGFloat(i)
            
            imageView.frame = CGRect(x: xPos, y: 0, width: 130, height: 110)
            
            scrollView.contentSize.width = 135 * CGFloat(i+1)
            scrollView.addSubview(imageView)
            self.setNeedsDisplay()
        }
        
    }
    
    func runCamera(_ action: UIAlertAction) {
        
    }
}

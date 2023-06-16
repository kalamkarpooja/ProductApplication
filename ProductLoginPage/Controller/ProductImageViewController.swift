//
//  ProductImageViewController.swift
//  ProductLoginPage
//
//  Created by Mac on 21/06/35.
//

import UIKit

class ProductImageViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var product : Product?
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = product?.title
        let urlstring = product?.image
        let url = URL(string: urlstring!)
        img.sd_setImage(with: url)
    }
    
}

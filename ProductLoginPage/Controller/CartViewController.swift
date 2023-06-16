//
//  CartViewController.swift
//  ProductLoginPage
//
//  Created by Mac on 20/04/22.
//

import UIKit
import SDWebImage
class CartViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var product : Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = product!.title
        let urlstring = product!.image
        let url = URL(string: urlstring)
        img.sd_setImage(with: url)
    }
    func addedToCartSuccessfully(){
        let alert = UIAlertController(title: title, message: "Added To Cart  Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            print("tapped ok")
        }))
        present(alert, animated: true)
    }
    @IBAction func addtoCart(_ sender: Any) {
        addedToCartSuccessfully()
        
    }
}

//
//  DetailProductViewController.swift
//  ProductLoginPage
//
//  Created by Mac on 15/06/23.
//

import UIKit

class DetailProductViewController: UIViewController {
    var defaults = UserDefaults.standard
    var product : Product?
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       let nm = defaults.value(forKey: "tag") as! Int
        idLabel.text = "\(product!.id)"
        titleLabel.text = product!.title
        priceLabel.text = "\(product!.price)" + "₹"
        ratingLabel.text = "\(product!.rating)"
        descLabel.text = product!.description
        let urlstring = product!.image
        let url = URL(string: urlstring)
        img.sd_setImage(with: url)
    }
    @IBAction func addToCartBtn(_ sender: Any) {
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
               cartVC.product = product
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @IBAction func cancleBtn(_ sender: Any) {
        let productVC = storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        
        navigationController?.popViewController(animated: true)
        // present(productVC, animated: true)
    }
}

//
//  ProductTableViewCell.swift
//  ProductLoginPage
//
//  Created by Mac on 21/06/35.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

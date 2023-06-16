//
//  ProductViewController.swift
//  ProductLoginPage
//
//  Created by Mac on 21/06/35.
//

import UIKit
import SDWebImage
class ProductViewController: UIViewController {
    var defaults = UserDefaults.standard
    var products = [Product]()
    @IBOutlet weak var productTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.dataSource = self
        productTableView.delegate = self
        fetchData()
        registerXib()
    }
    func registerXib(){
        let uinib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        productTableView.register(uinib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    func fetchData(){
        let urlstring = "https://fakestoreapi.com/products"
        let url = URL(string: urlstring)
        var urlrequest = URLRequest(url: url!)
        urlrequest.httpMethod = "Get"
        let session = URLSession.shared.dataTask(with: urlrequest){data,response,error in
            print(String(data: data!, encoding: .utf8))
            if(error == nil){
                let jsondecoder = try! JSONDecoder().decode([Product].self, from: data!)
                self.products = jsondecoder
            }
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
                
            }
            .resume()
        }
    }
extension ProductViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageVc = storyboard?.instantiateViewController(withIdentifier: "ProductImageViewController") as! ProductImageViewController
        imageVc.product = products[indexPath.row]
        navigationController?.pushViewController(imageVc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        cell.priceLabel.text = "Price - \(products[indexPath.row].price)" + "₹"
        cell.titleLabel.text = products[indexPath.row].title
        cell.descriptionLabel.text = "\(products[indexPath.row].rating)"
        let urlstring = products[indexPath.row].image
        let url = URL(string: urlstring)
        cell.img.sd_setImage(with: url)
        cell.layer.borderWidth = 3
        cell.layer.borderColor = .init(genericCMYKCyan: 1, magenta: 1, yellow: 0, black: 1, alpha: 1)
        cell.layer.cornerRadius = 35
        cell.buyBtn.addTarget(self, action: #selector(addToBtn), for: .touchUpInside)
        cell.buyBtn.tag = indexPath.row
        return cell
    }
    @objc func addToBtn(sender : UIButton){
            UserDefaults.standard.set(sender.tag, forKey: "tag")
            let indexPath = IndexPath(row: sender.tag, section: sender.tag) // Create IndexPath from the button's tag
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
            let tg = defaults.value(forKey: "tag")
            detailVC.product = products[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
             
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
}

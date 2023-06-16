//
//  Product.swift
//  ProductLoginPage
//
//  Created by Mac on 15/06/23.
//

import Foundation
struct root: Codable {
    let products : [Product]
}
struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let rating: Rating
}
//mark : rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

//
//  Product.swift
//  RxSwiftTrial
//
//  Created by Timotius Leonardo Lianoto on 27/06/21.
//

import Foundation
import RxCocoa
import RxSwift

struct Product {
    let imageName: String
    let title: String
}

struct ProductViewModel {
    var items = BehaviorRelay.init(value: [Product(imageName: "coklat", title: "Coklate"),
                                           Product(imageName: "ice cream", title: "Ek Krim"),
                                           Product(imageName: "lumpia", title: "Lumpia"),
                                           Product(imageName: "migor", title: "Mie Goreng"),
                                           Product(imageName: "nasgor", title: "Nasi Goreng"),
                                           Product(imageName: "pisgor", title: "Pisang Goreng"),
                                           Product(imageName: "pisang", title: "Pisang"),
                                           Product(imageName: "rawon", title: "Rawon"),
                                           Product(imageName: "rendang", title: "Rendang"),
                                           Product(imageName: "salad", title: "Salad"),
                                           Product(imageName: "semur", title: "Semur"),
                                           Product(imageName: "soto", title: "Soto Ayam")])
    
}

//
//  ImageReceiverViewController.swift
//  RxSwiftTrial
//
//  Created by Timotius Leonardo Lianoto on 24/06/21.
//

import UIKit

class ImageReceiverViewController: UIViewController {
    
   @IBOutlet weak var imageView: UIImageView?
    
    var imageName: String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView?.image = UIImage.init(systemName: imageName ?? "")
        
    }
    

}

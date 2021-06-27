//
//  ImageReceiverViewController.swift
//  RxSwiftTrial
//
//  Created by Timotius Leonardo Lianoto on 24/06/21.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class ImageReceiverViewController: UIViewController {
    
   @IBOutlet weak var imageView: UIImageView!
    
//    var imageName:
    var imageName: BehaviorRelay = BehaviorRelay<String>(value: "")
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageView?.image = UIImage.init(systemName: imageName ?? "")
        imageName.map({ name in
            UIImage.init(named: name)
        }).bind(to: imageView.rx.image).disposed(by: disposeBag)
        
    }
    

}

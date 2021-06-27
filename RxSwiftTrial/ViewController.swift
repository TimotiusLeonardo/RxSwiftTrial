//
//  ViewController.swift
//  RxSwiftTrial
//
//  Created by Timotius Leonardo Lianoto on 23/06/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var viewModel = ProductViewModel()
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rx.setDelegate(self).disposed(by: bag)
        bindTableData()
    }
    
    private func bindTableData() {
        // Bind items to table
        searchBar.rx.text.orEmpty
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map({ query in
                self.viewModel.items.value.filter ({ product in
                    query.isEmpty || product.title.lowercased().contains(query.lowercased())
                })
            }).bind(to: tableView.rx.items(cellIdentifier: "foodCell", cellType: ProductTableViewCell.self)) { row, model, cell in
            cell.productNameLabel.text = model.title
            cell.productImageView.image = UIImage(named: model.imageName)
        }.disposed(by: bag)
        
        // Bind a model selected handler
        tableView.rx.modelSelected(Product.self)
            .subscribe(onNext: { productObject in
                if let imageReceiverVC = self.storyboard?.instantiateViewController(identifier: "imageReceiver") as? ImageReceiverViewController {
                    imageReceiverVC.imageName.accept(productObject.imageName)
                    self.navigationController?.pushViewController(imageReceiverVC, animated: true)
                }
            }).disposed(by: bag)
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}


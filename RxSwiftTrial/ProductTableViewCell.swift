//
//  ProductTableViewCell.swift
//  RxSwiftTrial
//
//  Created by Timotius Leonardo Lianoto on 25/06/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    var productImageView: UIImageView!
    var productNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setView()
        addConstraintToComponent()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addConstraintToComponent() {
        // Content VIew Constraint
        contentView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8).isActive = true
        
        // Initiate Product Image View Constraint
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
//        productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: productImageView.bounds.height).isActive = true
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Initiate Product Name Label Constraint
        productNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 32).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        productNameLabel.centerYAnchor.constraint(equalTo: productImageView.centerYAnchor).isActive = true
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setView() {
        productImageView = UIImageView()
        productImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        productImageView.contentMode = .scaleToFill
        
        productNameLabel = UILabel()
        productNameLabel.text = "HAHAHAHAHAH"
        
        // Add Subview
        self.contentView.addSubview(productNameLabel)
        self.contentView.addSubview(productImageView)
    }

}

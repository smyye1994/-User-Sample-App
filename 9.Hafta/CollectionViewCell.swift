//
//  CollectionViewCell.swift
//  9.Hafta
//
//  Created by Sümeyye Kılıçoğlu on 4.09.2022.


import UIKit

class CustomollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomollectionViewCell"
    private var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
        
    }()
    private var myLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.textAlignment = .center
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-50,
                               width: contentView.frame.size.height-10,
                               height: 50)
        myImageView.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.height-10,
                               height: contentView.frame.size.height-50)
    }
    public func configure(label: String) {
        myLabel.text = label
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
}

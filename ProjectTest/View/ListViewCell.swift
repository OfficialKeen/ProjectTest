//
//  ListViewCell.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

class ListViewCell: UICollectionViewCell {
    let configs = Configs()
    let backView = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    var listModel: ListNewsModel.Article? {
        didSet {
            guard let images = listModel?.urlToImage else { return }
            guard let name = listModel?.title else { return }
            titleLabel.text = name
            
            if let imageURL = URL(string: images) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAnchor()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ListViewCell {
    fileprivate func setUI() {
        imageView.setObject {_ in
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 15
        }
        
        backView.setObjectView {_ in
            backView.setShadow(backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2016945423), shadowColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), shadowRadius: 10, cornerRadius: 10, opacity: 1, borderWidth: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
        
        titleLabel.setObject {_ in
            titleLabel.font = configs.sizeTextMedium24
            titleLabel.textColor = configs.colorWhite
        }
    }
    
    fileprivate func setAnchor() {
        addSubview(imageView)
        imageView.addSubview(backView)
        backView.addSubview(titleLabel)
        
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
        backView.setAnchor(top: nil, left: imageView.leftAnchor, bottom: imageView.bottomAnchor, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 50)
        
        titleLabel.setAnchor(top: backView.topAnchor, left: backView.leftAnchor, bottom: backView.bottomAnchor, right: backView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
    }
}


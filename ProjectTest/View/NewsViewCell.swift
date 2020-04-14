//
//  NewsViewCell.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

class NewsViewCell: UICollectionViewCell {
    var configs = Configs()
    
    let containerView = UIView()
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    
    var newsModel: NewsModel.Source? {
        didSet {
            guard let name = newsModel?.name else { return }
            guard let description = newsModel?.description else { return }
            nameLabel.text = name
            descriptionLabel.text = description
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bindUI()
        setAnchor()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension NewsViewCell {
    fileprivate func bindUI() {
        containerView.setObjectView {_ in
            containerView.setShadow(backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), shadowColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), shadowRadius: 10, cornerRadius: 10, opacity: 0.5, borderWidth: 0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
        
        nameLabel.setObject {_ in
            nameLabel.textColor = configs.colorBlack
            nameLabel.font = configs.sizeTextBold20
        }
        
        descriptionLabel.setObject {_ in
            descriptionLabel.textColor = configs.colorGrayCustom
            descriptionLabel.font = configs.sizeText18
            descriptionLabel.numberOfLines = 3
        }
    }
    
    fileprivate func setAnchor() {
        addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        
        containerView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
        nameLabel.setAnchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        
        descriptionLabel.setAnchor(top: nameLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
    }
}


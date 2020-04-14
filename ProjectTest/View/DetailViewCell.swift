//
//  DetailViewCell.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

class DetailViewCell: UICollectionViewCell {
    let configs = Configs()
    var actionWeb: (() -> Void)?
    let imageView = UIImageView()
    let openWebButton = UIButton(type: .system)
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAnchor()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension DetailViewCell {
    fileprivate func setUI() {
        imageView.setObject {_ in
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        }
        
        openWebButton.setObject {_ in
            openWebButton.setTitle("Open WEB", for: .normal)
            openWebButton.tintColor = configs.colorWhite
            openWebButton.backgroundColor = configs.colorGrayCustom
            openWebButton.layer.cornerRadius = 10
            openWebButton.addTarget(self, action: #selector(handleWeb), for: .touchUpInside)
        }
        
        titleLabel.setObject {_ in
            titleLabel.font = configs.sizeTextMedium20
            titleLabel.numberOfLines = 0
        }
        
        descriptionLabel.setObject {_ in
            descriptionLabel.font = configs.sizeTextMedium20
            descriptionLabel.numberOfLines = 0
        }
    }
    
    fileprivate func setAnchor() {
        addSubview(imageView)
        addSubview(openWebButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 400)
        
        openWebButton.setAnchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30)
        
        titleLabel.setAnchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        
        descriptionLabel.setAnchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
    }
}

extension DetailViewCell {
    @objc func handleWeb() {
        actionWeb!()
    }
}

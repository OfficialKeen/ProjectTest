//
//  DetailViewController.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var collectionView: UICollectionView!
    var detailViewCell = "detailViewCell"
    var imageView: String = ""
    var titleLabel: String = ""
    var descriptionLabel: String = ""
    var urlWeb: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
}


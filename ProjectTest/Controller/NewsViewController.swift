//
//  ViewController.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    let configs = Configs()
    var apiHandler = APIHandler()
    var datasourceArray = [NewsModel.Source]()
    var datasource = [NewsModel.Source]()
    var collectionView: UICollectionView!
    var newsViewCell = "newsViewCell"
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
}


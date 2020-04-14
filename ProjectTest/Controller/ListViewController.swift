//
//  ListViewController.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    var apiHandler = APIHandler()
    var datasourceArray = [ListNewsModel.Article]()
    var datasourceFilter = [ListNewsModel.Article]()
    let searchBar = UISearchBar()
    var collectionView: UICollectionView!
    var listViewCell = "listViewCell"
    var news: String = ""
    var nameLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
}


//
//  ListViewController+Extention.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

extension ListViewController {
    func bindData() {
        getDataNews()
        setNav()
        setCollectionView()
        setRegister()
        setAnchor()
    }
}

extension ListViewController {
    fileprivate func getDataNews() {
        CustomActivityIndicator.shared.show(uiView: self.view, backgroundColor: .lightGray)
        apiHandler.getListDataNews(news) { (arr) in
            self.datasourceArray = arr
            self.datasourceFilter = self.datasourceArray
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                CustomActivityIndicator.shared.hide(uiView: (self.view)!)
            }
        }
    }
    fileprivate func setNav() {
        view.backgroundColor = UIColor.white
        title = nameLabel
        searchBar.sizeToFit()
        searchBar.delegate = self
        showSearchBarButton(shouldShow: true)
    }
    
    fileprivate func setCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
    }
    
    fileprivate func setRegister() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ListViewCell.self, forCellWithReuseIdentifier: listViewCell)
    }
    
    fileprivate func setAnchor() {
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

extension ListViewController {
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
            navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @objc func handleShowSearchBar() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8532154235, green: 0.8532154235, blue: 0.8532154235, alpha: 1)
    }
}

extension ListViewController: UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasourceFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listViewCell, for: indexPath) as! ListViewCell
        
        cell.listModel = datasourceFilter[indexPath.row]
        return cell
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let items = datasourceFilter[indexPath.item]
        let detailViewController = DetailViewController()
        detailViewController.imageView = items.urlToImage ?? ""
        detailViewController.titleLabel = items.title ?? ""
        detailViewController.descriptionLabel = items.description ?? ""
        detailViewController.urlWeb = items.url ?? ""
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
        getDataNews()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            datasourceFilter = datasourceArray
            return
        }
        
        datasourceFilter = datasourceArray.filter({ data -> Bool in
            return (data.title?.lowercased().contains(searchText.lowercased()))!
        })
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
}


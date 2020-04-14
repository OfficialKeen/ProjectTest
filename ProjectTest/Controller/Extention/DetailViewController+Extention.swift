//
//  DetailViewController+Extention.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

extension DetailViewController {
    func bindData() {
        getDataNews()
        setNav()
        setCollectionView()
        setRegister()
        setAnchor()
    }
}

extension DetailViewController {
    fileprivate func getDataNews() {
        CustomActivityIndicator.shared.show(uiView: self.view, backgroundColor: .lightGray)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            CustomActivityIndicator.shared.hide(uiView: (self.view)!)
        }
    }
    
    fileprivate func setNav() {
        view.backgroundColor = UIColor.white
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
        collectionView.register(DetailViewCell.self, forCellWithReuseIdentifier: detailViewCell)
    }
    
    fileprivate func setAnchor() {
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    fileprivate func actionWeb() {
        if let url = URL(string: urlWeb) {
            UIApplication.shared.open(url)
        }
    }
}

extension DetailViewController: UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailViewCell, for: indexPath) as! DetailViewCell
        
        if let imageURL = URL(string: imageView) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageView.image = image
                    }
                }
            }
        }
        cell.titleLabel.text = titleLabel
        cell.descriptionLabel.text = descriptionLabel
        cell.actionWeb = { self.actionWeb() }
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


//
//  Library+Extention.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import UIKit

extension UILabel {
    func setObject(completion: (UILabel) -> Void) {
        completion(self)
    }
}

extension UIImageView {
    func setObject(completion: (UIImageView) -> Void) {
        completion(self)
    }
}

extension UIStackView {
    func setObject(completion: (UIStackView) -> Void) {
        completion(self)
    }
}

extension UIButton {
    func setObject(completion: (UIButton) -> Void) {
        completion(self)
    }
}

extension UIView {
    func setObjectView(completion: (UIView) -> Void) {
        completion(self)
    }
}

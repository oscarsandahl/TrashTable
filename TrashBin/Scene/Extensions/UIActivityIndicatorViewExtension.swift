//
//  UIActivityIndicatorViewExtension.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import UIKit

extension UIActivityIndicatorView {
    func showSpinner(isLoading: Bool) {
        if isLoading {
            self.startAnimating()
            self.isHidden = false
        } else {
            self.isHidden = true
            self.stopAnimating()
        }
    }
}

//
//  ViewController.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import UIKit

class ViewController: UIViewController {
    var presenter: OverviewPresenter!
    
    class func initViewController() -> UIViewController {
        let viewController = ViewController()
        viewController.presenter = OverviewPresenter(viewController)
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


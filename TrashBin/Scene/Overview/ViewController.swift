//
//  ViewController.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import UIKit

class ViewController: UIViewController {
    var presenter: OverviewPresenter!
    let tableView: UITableView = UITableView()
    
    class func initViewController() -> UIViewController {
        let viewController = ViewController()
        viewController.presenter = OverviewPresenter(viewController)
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(DocumentCell.self, forCellReuseIdentifier: DocumentCell.cellIdentifier)
        tableView.register(ReceiptCell.self, forCellReuseIdentifier: ReceiptCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}

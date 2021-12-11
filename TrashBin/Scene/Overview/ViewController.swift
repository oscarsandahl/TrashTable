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
        presenter.fetchAllDocumentsFromBackend()
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
        let item = presenter.documents[indexPath.row]
        
        switch item.fileType {
        case .document:
            if let cell = tableView.dequeueReusableCell(withIdentifier: DocumentCell.cellIdentifier, for: indexPath) as? DocumentCell {
                return cell.addValues(cell: cell, item: item)
            }
        case .receipt:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ReceiptCell.cellIdentifier, for: indexPath) as? ReceiptCell {
                return cell.addValues(cell: cell, item: item)
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.documents.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch presenter.documents[indexPath.row].fileType {
        case .document:
            let viewController = SelectedDocumentVC()
            navigationController?.pushViewController(viewController, animated: true)
        case .receipt:
            let viewController = SelectedReceiptVC()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

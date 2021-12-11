//
//  ReceiptCell.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import UIKit

class ReceiptCell: UITableViewCell {
    static let cellIdentifier = "receiptCell"
    
    let logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(systemName: "doc.plaintext.fill")
        return logo
    }()
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let type: UILabel = {
        let type = UILabel()
        type.translatesAutoresizingMaskIntoConstraints = false
        type.text = "RETUR"
        type.isHidden = true
        type.backgroundColor = .systemYellow
        return type
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let date: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ReceiptCell.cellIdentifier)
        setupCell()
    }
    
    func setupCell() {
        self.addSubview(logo)
        logo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        logo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(vStack)
        vStack.leftAnchor.constraint(equalTo: logo.rightAnchor, constant: 20).isActive = true
        vStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        vStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        vStack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        vStack.addArrangedSubview(type)
        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(date)
        
        self.accessoryType = .disclosureIndicator
    }
    
    func addValues(cell: ReceiptCell, item: DocumentsViewModel) -> ReceiptCell {
        cell.title.text = item.title
        
        if let date = item.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            cell.date.text = "\(dateFormatter.string(from: date))"
        }

        showReturnBanner(item: item)
        
        return cell
    }
    
    func showReturnBanner(item: DocumentsViewModel) {
        if item.receiptType == "RETURN" {
            type.isHidden = false
        } else {
            type.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

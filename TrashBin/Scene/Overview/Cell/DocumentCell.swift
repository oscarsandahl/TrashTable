//
//  DocumentCell.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import UIKit

class DocumentCell: UITableViewCell {
    static let cellIdentifier = "documentCell"

    let logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(systemName: "doc.on.doc.fill")
        return logo
    }()
    
    let vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    var date: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    let sender: UILabel = {
        let sender = UILabel()
        sender.translatesAutoresizingMaskIntoConstraints = false
        return sender
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DocumentCell.cellIdentifier)
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
        
        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(date)
        vStack.addArrangedSubview(sender)
        
        self.accessoryType = .disclosureIndicator
    }
    
    func addValues(cell: DocumentCell, item: DocumentsViewModel) -> DocumentCell {
        cell.title.text = item.title
        cell.sender.text = item.sender
        if let date = item.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            cell.date.text = "\(dateFormatter.string(from: date))"
        }
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

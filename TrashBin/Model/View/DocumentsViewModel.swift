//
//  DocumentsViewModel.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import Foundation

enum FileType: Decodable {
    case document
    case receipt
}

struct DocumentsViewModel {
    let title: String
    let date: Date?
    let sender: String?
    let receiptType: String?
    let fileType: FileType
    
    init(title: String, date: String, sender: String?, receiptType: String?, fileType: FileType) {
        self.title = title
        self.sender = sender
        self.receiptType = receiptType
        self.fileType = fileType
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.date = dateFormatter.date(from: date) ?? nil
    }
}

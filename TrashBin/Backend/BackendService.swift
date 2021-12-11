//
//  BackendService.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import Foundation

class BackendService {
    static let shared = BackendService()
    
    func loadDocuments(callback: @escaping BackendCallback<[DocumentsViewModel]>) {
        var documents: [DocumentsViewModel] = []
        
        if let location = Bundle.main.url(forResource: "Documents", withExtension: "json") {
            do {
                let data = try Data(contentsOf: location)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([DocumentModel].self, from: data)
                dataFromJson.forEach { item in
                    documents.append(DocumentsViewModel(title: item.subject, date: item.generated_at, sender: item.sender_name, receiptType: nil, fileType: .document))
                }
                callback(.success(documents))
            } catch  {
                callback(.failure(.empty))
            }
        }
    }
    
    func loadReceipt(callback: @escaping BackendCallback<[DocumentsViewModel]>) {
        var documents: [DocumentsViewModel] = []
        
        if let location = Bundle.main.url(forResource: "Receipts", withExtension: "json") {
            do {
                let data = try Data(contentsOf: location)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode(ReceiptRoot.self, from: data)
                dataFromJson.receipts.forEach { item in
                    documents.append(DocumentsViewModel(title: item.store_name, date: item.purchase_date, sender: nil, receiptType: item.type, fileType: .receipt))
                }
                callback(.success(documents))
            } catch  {
                callback(.failure(.empty))
            }
        }
    }
}

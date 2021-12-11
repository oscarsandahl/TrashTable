//
//  OverviewPresenter.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import Foundation

class OverviewPresenter {
    weak var view: ViewController?
    var documents: [DocumentsViewModel] = []
    
    init(_ view: ViewController) {
        self.view = view
    }
    
    func fetchAllDocumentsFromBackend() {
        fetchDocumentsFromBackend()
        fetchReceiptFromBackend()
    }
    
    func fetchDocumentsFromBackend() {
        BackendService.shared.loadDocuments { result in
            switch result {
            case .success(let result):
                self.documents.append(contentsOf: result)
            default:
                print("Show error alert here")
            }
        }
    }
    
    func fetchReceiptFromBackend() {
        BackendService.shared.loadReceipt { result in
            switch result {
            case .success(let result):
                self.documents.append(contentsOf: result)
            default:
                print("Show error alert here")
            }
        }
    }
}

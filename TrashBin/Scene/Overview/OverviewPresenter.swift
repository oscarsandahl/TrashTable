//
//  OverviewPresenter.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import Foundation

class OverviewPresenter {
    weak var view: ViewController?
    var tableContent: [TableSection] = []
    private var documents: [DocumentsViewModel] = []
    
    init(_ view: ViewController) {
        self.view = view
    }
    
    func fetchAllDocumentsFromBackend() {
        view?.activityIndicatior.showSpinner(isLoading: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.fetchDocumentsFromBackend()
            self.fetchReceiptFromBackend()
            self.sortItemsByDateAscending()
            self.sortMonths()
            self.view?.activityIndicatior.showSpinner(isLoading: false)
            self.view?.tableView.reloadData()
        }
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
    
    func sortItemsByDateAscending() {
        var sortedArray: [DocumentsViewModel] = []
        sortedArray = documents.sorted(by: { $0.date?.compare($1.date ?? .distantFuture) == .orderedAscending })
        documents = sortedArray
    }
    
    func sortMonths() {
        var monthsArray: [Int] = []
        documents.forEach { document in
            if let date = document.date {
                let calenderDate = Calendar.current.dateComponents([.month], from: date)
                if let month = calenderDate.month {
                    monthsArray.append(month)
                }
            }
        }

        monthsArray = monthsArray.removingDuplicates()
        monthsArray.forEach { month in
            tableContent.append(TableSection(month: month, documents: []))
        }
        
        documents.forEach { document in
            if let date = document.date {
                let calenderMonth = Calendar.current.dateComponents([.month], from: date)
                if let month = calenderMonth.month {
                    if let index = tableContent.enumerated().first(where: {$0.element.month == month}) {
                        tableContent[index.offset].documents.append(document)
                    }
                }
            }
        }
    }
}

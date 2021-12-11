//
//  ReceiptModel.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import Foundation

struct ReceiptRoot: Decodable {
    let receipts: [ReceiptModel]
}

struct ReceiptModel: Decodable {
    let type: String
    let store_name: String
    let purchase_date: String
}

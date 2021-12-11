//
//  DocumentModel.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import Foundation

struct DocumentModel: Decodable {
    let subject: String
    let generated_at: String
    let sender_name: String
}

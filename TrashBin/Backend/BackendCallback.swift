//
//  BackendCallback.swift
//  TrashBin
//
//  Created by Sandahl, Oscar on 2021-12-11.
//

import Foundation

typealias BackendCallback<T> = (Result<T, BackendError>) -> Void

enum BackendError: Error {
    case empty
    case error(message: String)
}

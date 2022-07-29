//
//  APISupport.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 26/07/22.
//

import Foundation

enum APIError: Error {
    case badUrl(string: String)
    case requestFailed(error: Error)
    case invalidData
    case decodedFailed(error: Error, textData: String?)
}

enum HTTPMethod: String {
    case `get`
    case post
    case delete
}

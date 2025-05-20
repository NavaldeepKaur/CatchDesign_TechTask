//
//  APIError.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case networkError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid API URL."
        case .invalidResponse:
            return "Invalid server response."
        case .decodingError:
            return "Failed to decode data."
        case .networkError(let message):
            return message
        }
    }
}

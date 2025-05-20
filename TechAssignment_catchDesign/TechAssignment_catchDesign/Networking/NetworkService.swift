//
//  NetworkService.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchHomeList() -> AnyPublisher<[HomeModel], APIError>
}

class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    
    func fetchHomeList() -> AnyPublisher<[HomeModel], APIError> {
        // Check URL validity
        guard let url = URL(string: APIAddress.homeListApiUrl) else {
            return Fail(error: APIError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        // Create a data task publisher and handle the response
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output -> Data in
                // Validate HTTP response code 200
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw APIError.invalidResponse
                }
                return output.data
            }
            // Decode JSON data to your model
            .decode(type: [HomeModel].self, decoder: JSONDecoder())
            .mapError { error in
                // Map Combine or Decoding errors to your APIError enum
                if let apiError = error as? APIError {
                    return apiError
                } else if let urlError = error as? URLError {
                    return APIError.networkError(urlError.localizedDescription)
                } else {
                    return APIError.decodingError
                }
            }
            //Receive on main thread (for UI updates)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}

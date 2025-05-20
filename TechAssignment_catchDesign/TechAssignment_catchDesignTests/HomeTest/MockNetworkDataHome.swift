//
//  MockNetworkDataHome.swift
//  TechAssignment_catchDesignTests
//
//  Created by Navaldeep Kaur on 20/05/25.
//

import Foundation
import Combine

@testable import TechAssignment_catchDesign

class MockNetworkServiceSuccess: NetworkServiceProtocol {
    func fetchHomeList() -> AnyPublisher<[HomeModel], APIError> {
        let mockData = [HomeModel(id: 1, title: "Mock Title", subtitle: "sub title", content: "content")]
        return Just(mockData)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
}

// Mock failure
class MockNetworkServiceFailure: NetworkServiceProtocol {
    func fetchHomeList() -> AnyPublisher<[HomeModel], APIError> {
        let error = APIError.invalidResponse 
        return Fail(error: error)
            .eraseToAnyPublisher()
    }
}

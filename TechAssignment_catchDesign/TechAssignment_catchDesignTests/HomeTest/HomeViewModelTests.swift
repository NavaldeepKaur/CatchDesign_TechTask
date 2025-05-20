//
//  TechAssignment_catchDesignTests.swift
//  TechAssignment_catchDesignTests
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import XCTest
import Combine

@testable import TechAssignment_catchDesign

final class HomeViewModelTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []

    func testLoadHomeListSuccess() {
        // Given
        let mockService = MockNetworkServiceSuccess()
        let viewModel = HomeViewModel(networkService: mockService)
        let expectation = XCTestExpectation(description: "Successfully loads home list")

        // When
        viewModel.$homeList
            .dropFirst()
            .sink { homeList in
                // Then
                XCTAssertEqual(homeList.count, 1)
                XCTAssertEqual(homeList.first?.title, "Mock Title")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.loadHomeList()

        wait(for: [expectation], timeout: 1.0)
    }

    func testLoadHomeListFailure() {
        // Given
        let mockService = MockNetworkServiceFailure()
        let viewModel = HomeViewModel(networkService: mockService)
        let expectation = XCTestExpectation(description: "Handles failure")

        // When
        viewModel.$errorMessage
            .dropFirst()
            .sink { error in
                // Then
                XCTAssertEqual(error, "Invalid server response.")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.loadHomeList()

        wait(for: [expectation], timeout: 1.0)
    }
}

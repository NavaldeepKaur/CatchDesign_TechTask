//
//  HomeViewModel.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    @Published var homeList: [HomeModel] = []
    @Published var errorMessage: String?
    
    private let networkService: NetworkServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func loadHomeList() {
        networkService.fetchHomeList()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break // No-op
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { data in
                self.homeList = data
            })
            .store(in: &cancellables)
    }
}

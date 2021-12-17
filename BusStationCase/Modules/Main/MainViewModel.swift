//
//  MainViewModel.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import Foundation
import UIKit
import DefaultNetworkOperationPackage

class MainViewModel {
    
    private let formatter: MainViewFormatterProtocol
    private var data: Bus?
    private var state: MainViewStateBlock?
    
    init(formatter: MainViewFormatterProtocol) {
        self.formatter = formatter
    }
    
    func subscribeState(completion: @escaping MainViewStateBlock) {
        state = completion
    }
    
    func getBusesList() {
        state?(.loading)
        fireApiCall(with: apiCallHandler)
    }
    
    private func fireApiCall(with completion: @escaping (Result<Bus, ErrorResponse>) -> Void) {
        do {
            let urlRequest = try MainApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    // MARK: - CallBack Listener
    private lazy var apiCallHandler: (Result<Bus, ErrorResponse>) -> Void = { [weak self] result in
         switch result {
         case .failure(let error):
             print("error : \(error)")
         case .success(let response):
            print("success: \(response)")
             self?.data = response
         }
        self?.state?(.done)
    }
}

extension MainViewModel: ItemListProtocol {
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        // return 0
        guard let dataUnwrapped = data else { return 0 }
        return dataUnwrapped.stations.count
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        // return nil
        guard let dataUnwrapped = data else { return nil }
       // return formatter.getItem(from: dataUnwrapped.data.results[index])
        return formatter.getItem(from: dataUnwrapped.stations[index].buses[index])
    }
}

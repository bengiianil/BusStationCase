//
//  MainApiServiceProvider.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MainApiServiceProvider: ApiServiceProvider<BaseRequest> {
    
    static let url = "https://private-ba4027-busremainingtime.apiary-mock.com/stations"
    
    init() {
        super.init(method: .get, baseUrl: Self.url)
    }
    
}

//
//  MainViewFormatterProtocol.swift
//  BusStationCase
//
//  Created by Bengi Anıl on 17.12.2021.
//

import Foundation

protocol MainViewFormatterProtocol {
    
    func getItem(from data: BusElement) -> ItemTableViewCellData
}

//
//  MainResponse.swift
//  UIComponents
//
//  Created by Bengi on 7.10.2021.
//

import Foundation

// MARK: - Bus
struct Bus: Codable {
    let stations: [Station]
}

// MARK: - Station
struct Station: Codable {
    let stationName, stationCode: String
    let location: Location
    let buses: [BusElement]
}

// MARK: - BusElement
struct BusElement: Codable {
    let remainingTime: Int
    let plate, routeCode: String
    let icon: String
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double
}

//
//  MainViewFormatter.swift
//  BusStationCase
//
//  Created by Bengi Anıl on 17.12.2021.
//

import Foundation
import UIKit

class MainViewFormatter: MainViewFormatterProtocol {
    
    func getItem(from data: BusElement) -> ItemTableViewCellData {
        return ItemTableViewCellData(
            imageData: CustomImageViewComponentData(imageUrl: "https://img.icons8.com/1AC003/48/pastel-glyph/bus"),
            routeInfo: LabelPackComponentData(title: data.routeCode, subtitle: ""),
            remainingInfo: LabelPackComponentData(title: "\(data.remainingTime)", subtitle: ""))
    }
}

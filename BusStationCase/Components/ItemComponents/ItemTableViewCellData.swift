//
//  ItemTableViewData.swift
//  UIComponents
//
//  Created by Bengi on 6.10.2021.
//

import Foundation

class ItemTableViewCellData: GenericDataProtocol {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var routeInfo: LabelPackComponentData
    private(set) var remainingInfo: LabelPackComponentData

    init(imageData: CustomImageViewComponentData, routeInfo: LabelPackComponentData, remainingInfo: LabelPackComponentData) {
        self.imageData = imageData
        self.routeInfo = routeInfo
        self.remainingInfo = remainingInfo
    }
 
}

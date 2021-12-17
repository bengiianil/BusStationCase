//
//  MainViewState.swift
//  UIComponents
//
//  Created by Bengi on 8.10.2021.
//

import Foundation

typealias MainViewStateBlock = (MainViewState) -> Void

enum MainViewState {
    
    case loading
    case done
    case failure
    
}

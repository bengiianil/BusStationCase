//
//  MainViewBuilder.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        
        let formatter = MainViewFormatter()
        let viewModel = MainViewModel(formatter: formatter)
        let viewController = MainViewController(viewModel: viewModel)
        viewController.title = "Main"
        return viewController
    }
}

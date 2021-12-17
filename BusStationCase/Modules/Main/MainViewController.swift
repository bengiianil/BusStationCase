//
//  MainViewController.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    private var itemListView: ItemListView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addItemListView()
        subscribeViewModelListeners()
        viewModel.getBusesList()
    }
    private func addItemListView() {
        
        itemListView = ItemListView()
        itemListView.translatesAutoresizingMaskIntoConstraints = false
        itemListView.delegate = viewModel
        
        view.addSubview(itemListView)
        
        NSLayoutConstraint.activate([
        
            itemListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemListView.topAnchor.constraint(equalTo: view.topAnchor),
            itemListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeViewModelListeners() {
        
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                print("Data is ready.")
                self?.itemListView.reloadTableView()
            case .loading:
                print("Data is getting.")
            case .failure:
                print("Error")
            }
        }
    }
}



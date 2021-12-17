//
//  LabelPackComponent.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import Foundation
import UIKit

class LabelPackComponent: GenericBaseView<LabelPackComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.text = " "
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.contentMode = .center
        title.textAlignment = .center
        return title
    }()
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setMainStackView()
        setupTitleConfigurations()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    func addUserComponents() {
        
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    // To load the data
    override func loadDataView() {
        
        super.loadDataView()
        
        // If there is no data, because its optional
        guard let data = returnData() else{ return }
        
        titleLabel.text = data.title
    }
    
    private func setMainStackView() {
        guard let data = returnData() else { return }

        mainStackView.alignment = data.stackViewAlignment
        mainStackView.spacing = data.spacing
    }
    
    private func setupTitleConfigurations() {
        guard let data = returnData() else { return }
        
        titleLabel.lineBreakMode = data.titleLabelDistributionData.lineBreakMode
        titleLabel.numberOfLines = data.titleLabelDistributionData.numberOfLines
        titleLabel.contentMode = data.titleLabelDistributionData.contentMode
        titleLabel.textAlignment = data.titleLabelDistributionData.textAlignment
    }
}

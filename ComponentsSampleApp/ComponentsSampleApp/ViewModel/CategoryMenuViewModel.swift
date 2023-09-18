//
//  CategoryMenuViewModel.swift
//  ComponentsSampleApp
//
//  Created by Luiz Diniz Hammerli on 13/09/23.
//

import Foundation

struct CategoryMenuViewModel {
    var categories: [Category] {
        [
            .init(title: "Collections", subCategories: [.init(title: "TagView", controller: TagViewController())]),
            .init(title: "Buttons", subCategories: [.init(title: "Rounded", controller: TagButtonViewController())])
        ]
    }
}

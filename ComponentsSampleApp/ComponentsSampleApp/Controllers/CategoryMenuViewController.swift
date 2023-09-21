//
//  ViewController.swift
//  ComponentsSampleApp
//
//  Created by Luiz Diniz Hammerli on 12/09/23.
//

import UIKit

final class CategoryMenuViewController: UITableViewController {
    let viewModel: CategoryMenuViewModel
    let cellID = "cellID"
    
    init(viewModel: CategoryMenuViewModel = CategoryMenuViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Categories"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = SubcategoryMenuViewController(categories: viewModel.categories[indexPath.row].subCategories)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = viewModel.categories[indexPath.row].title
        return cell
    }
}

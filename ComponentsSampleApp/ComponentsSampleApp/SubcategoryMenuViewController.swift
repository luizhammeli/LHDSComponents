//
//  SubcategoryMenuViewController.swift
//  ComponentsSampleApp
//
//  Created by Luiz Diniz Hammerli on 13/09/23.
//

import UIKit

final class SubcategoryMenuViewController: UITableViewController {
    let categories: [Subcategory]
    let cellID = "cellID"
    
    init(categories: [Subcategory]) {
        self.categories = categories
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Subcategories"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = categories[indexPath.row].controller
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].title
        return cell
    }
}

//
//  ViewController.swift
//  ComponentsSampleApp
//
//  Created by Luiz Diniz Hammerli on 12/09/23.
//

import UIKit

final class CategoryMenuViewController: UITableViewController {
    let categories: [Category] = [.init(title: "Collections", subCategories: [.init(title: "TagView", controller: TagViewController())])]
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cateogies"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = SubcategoryMenuViewController(categories: categories[indexPath.row].subCategories)
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
        navigationItem.title = "Subcateogies"
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

struct Category {
    let title: String
    let subCategories: [Subcategory]
}

struct Subcategory {
    let title: String
    let controller: UIViewController
}


final class TagViewController: UIViewController {
//    let tagView = TagView(tags: ["hardcore", "music", "live", "metal", "metalcore", "show", "gig", "concert", "australia", "brazil", "rock", "band", "or" ,"screamo"],
//                          width: UIScreen.main.bounds.width - 32)
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        //setupViews()
    }
//}
//
//extension TagViewController: CodeView {
//    func buildViewHierarchy() {
//        view.addSubview(tagView)
//    }
//
//    func setupConstraints() {
//        tagView.anchor(leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
//        tagView.centerYInSuperview()
//    }
//
//    func setupAdditionalConfiguration() {
//        view.backgroundColor = .systemBackground
//    }
}

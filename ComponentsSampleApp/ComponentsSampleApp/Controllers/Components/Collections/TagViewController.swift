//
//  TagViewController.swift
//  ComponentsSampleApp
//
//  Created by Luiz Diniz Hammerli on 13/09/23.
//

import UIKit
import LHHelpers
import LHDSComponents

final class TagViewController: UIViewController {
    private let tags = ["hardcore", "music", "live", "metal", "metalcore", "show", "gig", "concert", "australia", "brazil", "rock", "band", "or" ,"screamo"]
    private lazy var staticTagView = TagView(tags: tags, width: UIScreen.main.bounds.width - 32)
    private lazy var buttonTagView = TagView(tags: tags, width: UIScreen.main.bounds.width - 32, delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()        
        navigationItem.largeTitleDisplayMode = .never
        setupViews()
    }
}

extension TagViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(staticTagView)
        view.addSubview(buttonTagView)
    }

    func setupConstraints() {
        staticTagView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor,
                       padding: UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16))
        
        buttonTagView.anchor(top: staticTagView.bottomAnchor,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor,
                       padding: UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16))
    }

    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "TagView"
    }
}

extension TagViewController: TagButtonViewDelegate {
    func didSelectTag(text: String, tag: Int) {
        let alert = UIAlertController(title: text, message: String(), preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

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
    let tagView = TagView(tags: ["hardcore", "music", "live", "metal", "metalcore", "show", "gig", "concert", "australia", "brazil", "rock", "band", "or" ,"screamo"],
                          width: UIScreen.main.bounds.width - 32)
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupViews()
    }
}

extension TagViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(tagView)
    }

    func setupConstraints() {
        tagView.anchor(leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        tagView.centerYInSuperview()
    }

    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBackground
    }
}

//
//  TagButtonViewController.swift
//  ComponentsSampleApp
//
//  Created by Luiz Diniz Hammerli on 18/09/23.
//

import UIKit
import LHHelpers
import LHDSComponents

final class TagButtonViewController: UIViewController {
    private lazy var button = TagButtonView(text: "Test Button", enableUserInteraction: true)

    override func viewDidLoad() {
        super.viewDidLoad()        
        setupViews()
    }
}

extension TagButtonViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(button)
    }

    func setupConstraints() {
        button.centerInSuperview()
    }

    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "TagButtonView"
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
    
    @objc private func handleButton() {
        let alert = UIAlertController(title: button.titleLabel?.text, message: String(), preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

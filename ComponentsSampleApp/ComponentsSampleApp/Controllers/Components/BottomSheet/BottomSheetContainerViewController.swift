//
//  BottomSheetContainerViewController.swift
//  ComponentsSampleApp
//
//  Created by Luiz Diniz Hammerli on 20/09/23.
//

import LHDSComponents
import LHHelpers
import UIKit

final class BottomSheetContainerViewController: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open BottomSheet", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc private func handleTap() {        
        let  bottomSheet = BottomSheetViewController(view: TestView(), height: 450)
        bottomSheet.show(controller: self)
    }
}

extension BottomSheetContainerViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(button)
    }
    
    func setupConstraints() {
        button.centerInSuperview()
        button.anchor(size: CGSize(width: 160, height: 30))
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBackground
        title = "Bottom Sheet"
    }
}

final class TestView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  TagView.swift
//  
//
//  Created by Luiz Diniz Hammerli on 11/09/23.
//

import UIKit
import LHHelpers

public protocol TagButtonViewDelegate: AnyObject {
    func didSelectTag(text: String, tag: Int)
}

public final class TagView: UIView {
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = vSpacing
        return stackView
    }()
    
    private var width: CGFloat
    private let hSpacing: CGFloat = 6
    private let vSpacing: CGFloat = 8
    private let buttonPadding: CGFloat = 14
    private let buttonHeight: CGFloat = 30
    private weak var delegate: TagButtonViewDelegate?
    
    public init(tags: [String] = [], width: CGFloat = .zero, delegate: TagButtonViewDelegate? = nil) {
        self.delegate = delegate
        self.width = width
        super.init(frame: .zero)
        setupTags(tags)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(tags: [String], width: CGFloat) {
        self.width = width
        setupTags(tags)
    }
    
    private func setupTags(_ tags: [String]) {
        var totalSize: CGFloat = .zero
        var lineLabels = [UIView]()
        let additionalSpacing = (buttonPadding * 2) + hSpacing
        let labels = tags.map { makeTagButton(text: $0) }
        
        labels.forEach { label in
            let font = label.titleLabel?.font ?? .systemFont(ofSize: 13)
            let labelSize = (label.titleLabel?.text?.width(withConstrainedHeight: buttonHeight, font: font) ?? .zero) + additionalSpacing
            totalSize += labelSize
            
            if (totalSize - hSpacing) < width {
                lineLabels.append(label)
            } else {
                setupHStackView(labels: lineLabels)
                lineLabels = [label]
                totalSize = labelSize
            }
        }
        
        if !lineLabels.isEmpty {
            setupHStackView(labels: lineLabels)
        }
    }
    
    private func cleanMainStackView() {
        let subviews = mainStackView.arrangedSubviews.map { $0 }
        subviews.forEach { mainStackView.removeArrangedSubview($0) }
    }
    
    private func makeTagButton(text: String) -> TagButtonView {
        let enableUserInteraction = delegate == nil ? false : true
        let button = TagButtonView(text: text, height: buttonHeight, padding: buttonPadding, enableUserInteraction: enableUserInteraction)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }

    private func setupHStackView(labels: [UIView]) {
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .horizontal
        stackView.spacing = hSpacing
        stackView.addArrangedSubview(UIView())
        stackView.setCustomSpacing(.zero, after: labels.last ?? UIView())
        mainStackView.addArrangedSubview(stackView)
    }
    
    @objc private func handleButton(_ button: UIButton) {
        delegate?.didSelectTag(text: button.titleLabel?.text ?? "", tag: button.tag)
    }
}

extension TagView: CodeView {
    public func buildViewHierarchy() {
        addSubview(mainStackView)
    }
    
    public func setupConstraints() {
        mainStackView.fillSuperview()
    }
    
    public func setupAdditionalConfiguration() {}
}

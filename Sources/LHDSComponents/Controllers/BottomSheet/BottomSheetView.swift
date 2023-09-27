//
//  BottomSheetView.swift
//
//
//  Created by Luiz Diniz Hammerli on 21/09/23.
//

import LHHelpers
import UIKit

public final class BottomSheetView: UIView {
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let gestureIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiaryLabel
        view.layer.cornerRadius = BorderRadius.superSmall
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.roundCorners(corners: [.topLeft, .topRight], radius: BorderRadius.medium)
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: Spacing.extraLarge, left: Spacing.extraLarge, bottom: Spacing.extraLarge, right: Spacing.extraLarge)
        return stackView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomSheetView: CodeView {
    public func buildViewHierarchy() {
        addSubview(bgView)
        addSubview(containerView)
        containerView.addSubview(gestureIndicatorView)
        containerView.addSubview(stackView)
    }
    
    public func setupConstraints() {
        bgView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        containerView.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)

        gestureIndicatorView.anchor(top: containerView.topAnchor, padding: UIEdgeInsets(top: Spacing.medium, left: .zero, bottom: .zero, right: .zero))
        gestureIndicatorView.centerXInSuperview()
        gestureIndicatorView.anchor(size: CGSize(width: 40, height: 4))

        stackView.fillSuperview()
    }

    public func setupAdditionalConfiguration() {
        containerView.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .secondarySystemBackground  : .systemBackground
    }
}

//
//  TagButtonView.swift
//  
//
//  Created by Luiz Diniz Hammerli on 11/09/23.
//

import UIKit

public final class TagButtonView: UIButton {
    private let enableUserInteraction: Bool

    public override var isHighlighted: Bool {
        didSet {
            if enableUserInteraction {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    guard let self else { return }
                    self.alpha = self.isHighlighted ? 0.5 : 1
                    self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
                }
            }
        }
    }
    
    public init(text: String, height: CGFloat = 30, padding: CGFloat = 14, enableUserInteraction: Bool = false) {
        self.enableUserInteraction = enableUserInteraction
        super.init(frame: .zero)
        setup(text: text, height: height, padding: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(text: String, height: CGFloat, padding: CGFloat) {
        let font = UIFont.systemFont(ofSize: 13, weight: .bold)

        setTitle(text, for: .normal)
        setTitleColor(.systemBackground, for: .normal)
        titleLabel?.font = font
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.8
        backgroundColor = .label
        layer.cornerRadius = height / 2
        
        let totalPadding = padding * 2
        let width = text.width(withConstrainedHeight: height, font: font) + totalPadding

        anchor(size: CGSize(width: width, height: height))
    }
}

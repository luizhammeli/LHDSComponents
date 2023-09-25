//
//  BottomSheetController.swift
//
//
//  Created by Luiz Diniz Hammerli on 20/09/23.
//

import LHHelpers
import UIKit

public final class BottomSheetViewController: CustomViewController<BottomSheetView> {
    private var totalHeight: CGFloat = 1000
    
    public init(view: UIView, height: CGFloat? = nil) {
        super.init(nibName: nil, bundle: nil)
        setup()
        setupChildView(view: view, height: height)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: Animation.defaultDuration) {
            self.customView.containerView.transform = CGAffineTransform.identity
        }
    }
    
    public func show(controller: UIViewController) {
        controller.present(self, animated: true)
    }
    
    private func setup() {
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
    }
    
    private func setupChildView(view: UIView, height: CGFloat?) {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let topPadding = scene?.windows.first?.safeAreaInsets.top ?? .zero
        if let height = height {
            totalHeight = min(height, (UIScreen.main.bounds.height - topPadding))
            customView.stackView.anchor(size: CGSize(width: .zero, height: totalHeight))
        }
        customView.stackView.addArrangedSubview(view)
        customView.containerView.transform = CGAffineTransform(translationX: 0, y: totalHeight)
    }
    
    private func setupGestures() {
        setupTapGesture()
        setupPanGesture()
    }
    
    private func setupPanGesture() {
        customView.containerView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }

    private func setupTapGesture() {
        customView.bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
    }
   
    @objc private func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let yValue = gesture.translation(in: customView.containerView).y
        let endThreshold = totalHeight * 0.2
        switch gesture.state {
        case .changed:
            if yValue > .zero {
                customView.containerView.transform = CGAffineTransform(translationX: .zero, y: yValue)
            }
        case .ended:
            guard yValue > endThreshold else {
                UIView.animate(withDuration: Animation.defaultDuration) {
                    self.customView.containerView.transform = .identity
                }
                return
            }
            handleTapGesture()
        default:
            break
        }
    }
    
    @objc private func handleTapGesture() {
        UIView.animate(withDuration: Animation.defaultDuration) {
            self.customView.containerView.transform = CGAffineTransform(translationX: .zero, y: UIScreen.main.bounds.height)
        }
        self.dismiss(animated: true)
    }
}

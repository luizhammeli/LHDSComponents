//
//  BottomSheetViewControllerTests.swift
//
//
//  Created by Luiz Diniz Hammerli on 22/09/23.
//

import XCTest
@testable import LHDSComponents

final class BottomSheetViewControllerTests: XCTestCase {
    func test_setup_shouldSetupCorrectly() {
        let sut = makeSut()
        XCTAssertEqual(sut.modalTransitionStyle, .crossDissolve)
        XCTAssertEqual(sut.modalPresentationStyle, .overFullScreen)
        XCTAssertEqual(sut.view.backgroundColor, UIColor.black.withAlphaComponent(0.4))
    }
    
    func test_setupChildView_shouldAddChildView() {
        let view = UIView()
        let sut = makeSut(view: view)
        XCTAssertEqual(sut.childViews, [view])
    }
    
    func test_setupChildView_shouldHideTheRoundedContainer() {
        let sut = makeSut(height: 50)
        XCTAssertEqual(sut.roundedContainer.transform, CGAffineTransform(translationX: 0, y: 50))
    }
    
    func test_setupChildView_shouldSetHeightAnchor() {
        let sut = makeSut()
        XCTAssertNotNil(sut.roundedContainer.heightAnchor)
    }
    
    func test_setupGestures_shouldSetGestures() {
        let sut = makeSut()
        XCTAssertEqual(sut.bgView.gestureRecognizers?.count, 1)
        XCTAssertEqual(sut.roundedContainer.gestureRecognizers?.count, 1)
    }
    
    func test_show_shouldPresentBottomSheetController() {
        let controller = UIViewController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = controller
        let sut = makeSut()
        
        sut.show(controller: controller)
                
        XCTAssertEqual(controller.presentedViewController, sut)
    }
}

private extension BottomSheetViewControllerTests {
    func makeSut(view: UIView = UIView(), height: CGFloat = .zero) -> BottomSheetViewController {
        let sut = BottomSheetViewController(view: view, height: height)
        sut.loadViewIfNeeded()
        return sut
    }
}

private extension BottomSheetViewController {
    var childViews: [UIView] {
        customView.stackView.arrangedSubviews
    }
    
    var roundedContainer: UIView {
        customView.containerView
    }
    
    var bgView: UIView {
        customView.containerView
    }
}

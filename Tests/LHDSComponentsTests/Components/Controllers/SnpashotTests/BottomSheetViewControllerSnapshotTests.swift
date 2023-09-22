//
//  BottomSheetViewControllerSnapshotTests.swift
//
//
//  Created by Luiz Diniz Hammerli on 22/09/23.
//

import XCTest
import SnapshotTesting
@testable import LHDSComponents

final class BottomSheetViewControllerSnapshotTests: XCTestCase {
    func test_snapshot_after_render() {
        let view = UIView()
        view.backgroundColor = .red
        
        let sut = BottomSheetViewController(view: view, height: 300)
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone8(.portrait), perceptualPrecision: 0.99))
    }
    
    func test_snapshot_after_render_withSmallSize() {
        let view = UIView()
        view.backgroundColor = .red
        
        let sut = BottomSheetViewController(view: view, height: 100)
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone8(.portrait), perceptualPrecision: 0.99))
    }
    
    func test_snapshot_after_render_withAllScreenSize() {
        let view = UIView()
        view.backgroundColor = .red
        
        let sut = BottomSheetViewController(view: view, height: 2000)
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone8(.portrait), perceptualPrecision: 0.99))
    }
}

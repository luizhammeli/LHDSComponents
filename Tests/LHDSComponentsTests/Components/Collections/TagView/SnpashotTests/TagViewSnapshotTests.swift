//
//  TagViewSnapshotTests.swift
//  
//
//  Created by Luiz Diniz Hammerli on 15/09/23.
//

import SnapshotTesting
import XCTest
@testable import LHDSComponents

final class TagViewSnapshotTests: XCTestCase {
    let fakeTags = ["val1", "val2", "val3", "val4"]
    
    func test_snapshot_after_render_tagView_withOneLine() {
        let sut = makeSut(tags: fakeTags, width: 375)
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 375, height: 30)))
    }
    
    func test_snapshot_after_render_tagView_withTwoLines() {
        let sut = makeSut(tags: fakeTags, width: 200)
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 200, height: 68)))
    }
    
    func test_snapshot_after_render_tagView_withOneItem() {
        let sut = makeSut(tags: [fakeTags.first!], width: 375)
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 375, height: 30)))
    }

    func test_snapshot_after_render_tagView_empty() {
        let sut = makeSut(tags: [], width: 375)
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 375, height: 30)))
    }
}

private extension TagViewSnapshotTests {
    func makeSut(tags: [String], width: CGFloat, delegate: TagButtonViewDelegate? = nil) -> TagView {
        let sut = TagView(tags: tags, width: width, delegate: delegate)
        return sut
    }
}

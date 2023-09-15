import SnapshotTesting
import XCTest
@testable import LHDSComponents

final class TagViewTests: XCTestCase {
    func test_setupTags_shouldSetTwoLines() {
        let tags = ["val1", "val2", "val3", "val4"]
        let sut = makeSut(tags: tags, width: 200)
        
        XCTAssertEqual(sut.stackLines.count, 2)
    }
    
    func test_setupTags_shouldSetOneLine() {
        let tags = ["val1", "val2", "val3"]
        let sut = makeSut(tags: tags, width: 200)
        
        XCTAssertEqual(sut.stackLines.count, 1)
    }
    
    func test_setupTags_shouldSetOneLineForASingTag() {
        let tags = ["val1"]
        let sut = makeSut(tags: tags, width: 200)
        
        XCTAssertEqual(sut.stackLines.count, 1)
    }
    
    func test_setupTags_shouldSetTitlesCorrectly() {
        let tags = ["val1", "val2", "val3", "val4"]
        let sut = makeSut(tags: tags, width: 200)
        XCTAssertEqual(sut.labels, ["val1", "val2", "val3", "val4"])
    }
    
    func test_setupTags_shouldReturnCorrectStyle() {
        let sut = makeSut(tags: ["val1"], width: 200)
        let button = sut.buttons.first
        
        XCTAssertEqual(button?.backgroundColor, .label)
        XCTAssertEqual(button?.titleLabel?.textColor, .systemBackground)
        XCTAssertEqual(button?.titleLabel?.font, .systemFont(ofSize: 13, weight: .bold))
    }
    
    func test_setupTags_shouldCallDelegate() {
        let spy = TagButtonViewDelegateSpy()
        let sut = makeSut(tags: ["val1"], width: 200, delegate: spy)
        let button = sut.buttons.first
        button?.simulateTap()
        
        XCTAssertEqual(spy.receivedText, ["val1"])
    }
}

private extension TagViewTests {
    func makeSut(tags: [String], width: CGFloat, delegate: TagButtonViewDelegate? = nil) -> TagView {
        let sut = TagView(tags: tags, width: width, delegate: delegate)
        return sut
    }
}

private extension TagView {
    var labels: [String] {
        return buttons.compactMap { $0.titleLabel?.text }
    }
    
    var buttons: [TagButtonView] {
        let hStacks = ((subviews.first as? UIStackView)?.arrangedSubviews.flatMap { $0 as? UIStackView })
        return hStacks?.flatMap { $0.arrangedSubviews.compactMap { $0 as? TagButtonView } } ?? []
    }
    
    var stackLines: [UIStackView] {
        ((subviews.first as? UIStackView)?.arrangedSubviews) as? [UIStackView] ?? []
    }
}

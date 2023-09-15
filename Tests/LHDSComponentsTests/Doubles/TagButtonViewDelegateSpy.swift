//
//  TagButtonViewDelegateSpy.swift
//  
//
//  Created by Luiz Diniz Hammerli on 15/09/23.
//

import Foundation
@testable import LHDSComponents

final class TagButtonViewDelegateSpy: TagButtonViewDelegate {
    var receivedText: [String] = []

    func didSelectTag(text: String, tag: Int) {
        receivedText.append(text)
    }
}

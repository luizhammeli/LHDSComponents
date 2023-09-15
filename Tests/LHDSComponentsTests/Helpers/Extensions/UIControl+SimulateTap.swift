//
//  UIControl+SimulateTap.swift
//  
//
//  Created by Luiz Diniz Hammerli on 15/09/23.
//

import UIKit

extension UIControl  {
    func simulateTap() {
        allTargets.forEach { target in
            guard let actions = actions(forTarget: target, forControlEvent: .touchUpInside),
                  let responder = target.base as? NSObject else { return }
            
            actions.map { Selector ($0) }.forEach { selector in
                if responder.responds (to: selector) {
                    responder.perform(selector, with: self)
                }
            }
        }
    }
}

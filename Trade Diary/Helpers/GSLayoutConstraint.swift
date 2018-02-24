//
//  GSLayoutConstraint.swift
//  Trade Diary
//
//  Created by Gianni Settino on 2018-02-23.
//  Copyright © 2018 Milton and Parc. All rights reserved.
//

import UIKit

class GSLayoutConstraint {
    enum Anchor {
        case leading
        case trailing
        case top
        case bottom
    }
    
    let anchor: Anchor
    let equalTo: AnyObject
    let constant: CGFloat
    
    init(_ anchor: Anchor, equalTo: AnyObject, constant: CGFloat = 0) {
        self.anchor = anchor
        self.equalTo = equalTo
        self.constant = constant
    }
    
    func toNSLayoutConstraint(forView view: UIView) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch anchor {
        case .leading:
            constraint = view.leadingAnchor.constraint(equalTo: equalTo as! NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: constant)
        case .trailing:
            constraint = view.trailingAnchor.constraint(equalTo: equalTo as! NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: constant)
        case .top:
            constraint = view.topAnchor.constraint(equalTo: equalTo as! NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: constant)
        case .bottom:
            constraint = view.bottomAnchor.constraint(equalTo: equalTo as! NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: constant)
        }
        return constraint
    }
}

extension UIView {
    func addConstraints(_ constraints: [GSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map{$0.toNSLayoutConstraint(forView: self)})
    }
    
    func pinToSuperview() {
        guard let superview = superview else { return }
        addConstraints([
            GSLayoutConstraint(.leading, equalTo: superview.leadingAnchor),
            GSLayoutConstraint(.trailing, equalTo: superview.trailingAnchor),
            GSLayoutConstraint(.top, equalTo: superview.topAnchor),
            GSLayoutConstraint(.bottom, equalTo: superview.bottomAnchor)
        ])
    }
}

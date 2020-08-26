//
//  ReusableView.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/8/19.
//

import UIKit

/// A view that can create its own reuse identifier
public protocol ReusableView
{
    static var reuseIdentifier: String { get }
}

public extension ReusableView
{
    static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

/// Allow all `UITableViewCell`s to create their own `reuseIdentifier` for cell reuse
extension UITableViewCell: ReusableView {}

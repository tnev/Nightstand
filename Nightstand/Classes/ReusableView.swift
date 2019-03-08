//
//  ReusableView.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/8/19.
//

import UIKit

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

extension UITableViewCell: ReusableView {}

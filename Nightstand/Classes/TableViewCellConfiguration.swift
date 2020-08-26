//
//  TableViewCellConfiguration.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/19/19.
//

import UIKit

/// An encapsulation of the style configuration options of a UITableViewCell
public struct TableViewCellConfiguration
{
    public var selectionStyle: UITableViewCell.SelectionStyle
    public var accessoryType: UITableViewCell.AccessoryType
    public var accessoryView: UIView?
    public var indentationLevel: NSInteger
    public var indentationWidth: CGFloat
    public var separatorInset: UIEdgeInsets
    public var backgroundView: UIView?
    public var estimatedHeightForCell: CGFloat
    
    public init()
    {
        selectionStyle = .default
        accessoryType = .none
        accessoryView = nil
        indentationLevel = 0
        indentationWidth = 0
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backgroundView = nil
        estimatedHeightForCell = UITableView.automaticDimension
    }
}

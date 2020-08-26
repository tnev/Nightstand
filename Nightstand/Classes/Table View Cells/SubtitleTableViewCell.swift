//
//  UserTableViewCell.swift
//  TableCoordinator_Example
//
//  Created by Tyler Neveldine on 2/5/19.
//  Copyright © 2019 Tyler Neveldine. All rights reserved.
//

import UIKit

/// A cell using the `.subtitle` style
public class SubtitleTableViewCell: UITableViewCell
{   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: SubtitleTableViewCell.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK - Model
extension SubtitleTableViewCell
{
    public struct Model
    {
        var text: String
        var detail: String?
        
        public init(text: String, detail: String?)
        {
            self.text = text
            self.detail = detail
        }
    }
}

// MARK: - Configurable

extension SubtitleTableViewCell: Configurable
{
    public func configure(with model: Model)
    {
        textLabel?.text = model.text
        detailTextLabel?.text = model.detail
    }
}


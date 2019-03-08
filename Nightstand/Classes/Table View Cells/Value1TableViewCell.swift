//
//  Value1TableViewCell.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/8/19.
//

import UIKit

public class Value1TableViewCell: UITableViewCell
{    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .value1, reuseIdentifier: Value1TableViewCell.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK - Model
extension Value1TableViewCell
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

extension Value1TableViewCell: Configurable
{
    public func configure(with model: Model)
    {
        textLabel?.text = model.text
        detailTextLabel?.text = model.detail
    }
}


//
//  DefaultTableViewCell.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/8/19.
//

import UIKit

public class DefaultTableViewCell: UITableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .default, reuseIdentifier: DefaultTableViewCell.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK - Model
extension DefaultTableViewCell
{
    public struct Model
    {
        var text: String
        var image: UIImage?
        
        public init(text: String, image: UIImage?)
        {
            self.text = text
            self.image = image
        }
    }
}

// MARK: - Configurable
extension DefaultTableViewCell: Configurable
{
    public func configure(with model: Model)
    {
        textLabel?.text = model.text
        imageView?.image = model.image
    }
}


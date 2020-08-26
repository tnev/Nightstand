//
//  ProfileTableViewCell.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 2/12/19.
//

import UIKit
import Nightstand

/// A custom UITableViewCell that conforms the the Configurable protocol and can
/// be used just like Nightstand's built-in cells.
public class UserTableViewCell: UITableViewCell
{
    // MARK: - Properties
    private lazy var stackView = UIStackView()
    lazy private var nameLabel = UILabel()
    lazy private var ageLabel = UILabel()
    lazy private var profileImageView = UIImageView()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: UserTableViewCell.reuseIdentifier)
        
        setupStackView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension UserTableViewCell
{
    private func setupStackView()
    {
        stackView.axis = .vertical
        stackView.alignment = .center
        
        contentView.addSubview(stackView)
        contentView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor)
            ])
    }
}

// MARK: - Model
extension UserTableViewCell
{
    public struct Model
    {
        var name: String
        var age: Int?
        var image: UIImage?
    }
}

// MARK: - Configurable
extension UserTableViewCell: Configurable
{
    public func configure(with model: Model)
    {
        nameLabel.text = model.name
        stackView.addArrangedSubview(nameLabel)
        
        if let age = model.age
        {
            ageLabel.text = String(age)
            stackView.addArrangedSubview(ageLabel)
        }
        
        if let image = model.image
        {
            stackView.addArrangedSubview(profileImageView)
            
            profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            profileImageView.contentMode = .scaleAspectFit
            profileImageView.image = image
        }
    }
}

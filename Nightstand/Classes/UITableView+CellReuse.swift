//
//  UITableView.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/8/19.
//

import UIKit

public extension UITableView
{
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else
        { fatalError("Unable to Dequeue Reusable Table View Cell") }
        
        return cell
    }
}

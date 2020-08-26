//
//  CellProvider.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/12/19.
//

import UIKit

/// A type that can provide a UITableView, its actions, and its configuration
public protocol CellProvider
{
    var actions: TableViewCellActions? { get }
    var configuration: TableViewCellConfiguration? { get }
    
    func cell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

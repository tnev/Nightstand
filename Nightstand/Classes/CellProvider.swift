//
//  CellProvider.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/12/19.
//

import UIKit

public protocol CellProvider
{
    var actions: TableViewCellActions? { get }
    var configuration: TableViewCellConfiguration? { get }
    
    func cell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

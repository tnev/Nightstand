//
//  Row.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/11/19.
//

import UIKit

public typealias RowCollection = [CellProvider]

public struct Row<Cell: UITableViewCell & Configurable>
{
    let model: Cell.Model
    public let actions: TableViewCellActions?
    public let configuration: TableViewCellConfiguration?
    
    public init(model: Cell.Model, actions: TableViewCellActions?, configuration: TableViewCellConfiguration?)
    {
        self.model = model
        self.actions = actions
        self.configuration = configuration
    }
}

extension Row: CellProvider
{
    public func cell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    {
        let cell: Cell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)
        
        if let configuration = configuration
        {
            cell.selectionStyle = configuration.selectionStyle
            cell.accessoryType = configuration.accessoryType
            cell.accessoryView = configuration.accessoryView
            cell.indentationLevel = configuration.indentationLevel
            cell.indentationWidth = configuration.indentationWidth
            cell.separatorInset = configuration.separatorInset
            cell.backgroundView = configuration.backgroundView
        }
        
        return cell
    }
}

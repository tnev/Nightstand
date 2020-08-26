//
//  Row.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/11/19.
//

import UIKit

public typealias RowCollection = [CellProvider]

/// The representation of a cell in a table view
public struct Row<Cell: UITableViewCell & Configurable>
{
    /// The model used to populate the row
    let model: Cell.Model

    /// The actions that can be taken on a row
    public let actions: TableViewCellActions?

    /// The UI configuration of the row
    public let configuration: TableViewCellConfiguration?

    /// Default Initializer
    public init(model: Cell.Model, actions: TableViewCellActions?, configuration: TableViewCellConfiguration?)
    {
        self.model = model
        self.actions = actions
        self.configuration = configuration
    }
}

// Allow for cell reuse
extension Row: CellProvider
{
    public func cell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    {
        // Dequeue and configure the cell
        let cell: Cell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)

        // Set the cell's style with the configuration object
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

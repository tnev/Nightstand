//
//  SectionedTableViewController.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/13/19.
//

import Foundation

public protocol SectionedTableViewController
{
    var sections: [Section] { get }
}

public extension SectionedTableViewController where Self: UITableViewDataSource
{
    func numberOfSections() -> Int
    {
        return sections.count
    }
    
    func numberOfRows(in section: Int) -> Int
    {
        return sections[section].rows.count
    }
    
    func cellForRowAt(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    {
        return sections[indexPath.section].rows[indexPath.row].cell(tableView, at: indexPath)
    }
    
    func titleForHeader(in section: Int) -> String?
    {
        return sections[section].title
    }
}

public extension SectionedTableViewController where Self: UITableViewDelegate
{
    func didSelectRow(at indexPath: IndexPath)
    {
        sections[indexPath.section].rows[indexPath.row].actions?.didSelectCell()
    }
    
    func accessoryButtonTapped(forRowAt indexPath: IndexPath)
    {
        sections[indexPath.section].rows[indexPath.row].actions?.didTapAccessoryView?()
    }
    
    func estimatedHeight(forRowAt indexPath: IndexPath) -> CGFloat
    {
        return sections[indexPath.section].rows[indexPath.row].configuration?.estimatedHeightForCell ?? UITableView.automaticDimension
    }
}


//
//  SectionedTableViewController.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/13/19.
//

import Foundation

/// The type responsible for managing sections and rows
public class Nightstand: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var sections: [Section] = []

    public init(sections: [Section]) {
        self.sections = sections
    }
}

// A Sectioned type is able to fulfill all of the requirements of a UITableViewDataSource
// and UITableViewDelegate

// MARK: -  UITableViewDataSource
public extension Nightstand
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].rows[indexPath.row].cell(tableView, at: indexPath)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}

// MARK: -  UITableViewDelegate
public extension Nightstand
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].rows[indexPath.row].actions?.didSelectCell()
    }

    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        sections[indexPath.section].rows[indexPath.row].actions?.didTapAccessoryView?()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section]
            .rows[indexPath.row]
            .configuration?
            .estimatedHeightForCell ?? UITableView.automaticDimension
    }
}


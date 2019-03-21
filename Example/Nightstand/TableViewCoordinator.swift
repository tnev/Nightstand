//
//  TableViewCoordinator.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 2/15/19.
//

import UIKit

class TableViewCoordinator: Coordinator
{
    unowned let rootNavigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController)
    {
        self.rootNavigationController = rootNavigationController
    }
    
    /// Pushes the CellChoice table onto the navigation stack
    func start()
    {
        let sections = SectionFactory().sections(for: .cellChoice, using: self)
        let tableViewController = TableViewController(coordinator: self, sections: sections)
        rootNavigationController.pushViewController(tableViewController, animated: true)
    }
    
    /// Navigtes to the given type of table
    func navigateTo(_ tableType: TableViewController.TableType)
    {
        let sections = SectionFactory().sections(for: tableType, using: self)
        let defaultCellTableViewController = TableViewController(coordinator: self, sections: sections)
        rootNavigationController.pushViewController(defaultCellTableViewController, animated: true)
    }
    
    /// Display an alert with the given title
    func displayAlert(withTitle title: String)
    {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        rootNavigationController.present(alertController, animated: true, completion: nil)
    }
}


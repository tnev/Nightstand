//
//  AppCoordinator.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 2/18/19.
//

import UIKit

class AppCoordinator: Coordinator
{
    unowned let rootNavigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(rootNavigationController: UINavigationController)
    {
        self.rootNavigationController = rootNavigationController
    }
    
    func start()
    {
        let tableViewCoordinaor = TableViewCoordinator(rootNavigationController: rootNavigationController)
        childCoordinators += [tableViewCoordinaor]
        tableViewCoordinaor.start()
    }
}

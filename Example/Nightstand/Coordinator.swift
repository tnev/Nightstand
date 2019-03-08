//
//  Coordinator.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 2/18/19.
//

import UIKit

protocol Coordinator
{
    var rootNavigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get }
}

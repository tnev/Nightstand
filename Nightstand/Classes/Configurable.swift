//
//  Configurable.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/5/19.
//

import Foundation

public protocol Configurable
{
    associatedtype Model
    func configure(with model: Model)
}

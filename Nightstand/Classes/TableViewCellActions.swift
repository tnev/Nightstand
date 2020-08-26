//
//  TableViewCellActions.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 3/3/19.
//

import Foundation

/// Actions that can be taken on a UITableViewCell
public struct TableViewCellActions
{
    let didSelectCell: (() -> Void)
    let didTapAccessoryView: (() -> Void)?
    
    public init (didSelectCell: @escaping () -> Void, didTapAccessoryView: (() -> Void)? = nil)
    {
        self.didSelectCell = didSelectCell
        self.didTapAccessoryView = didTapAccessoryView
    }
}

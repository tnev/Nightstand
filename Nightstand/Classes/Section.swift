//
//  Section.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/8/19.
//

import UIKit

public class Section
{
    public let title: String?
    public let rows: RowCollection
    public let headerView: UIView?
    public let footerView: UIView?
    
    public init(title: String?, rows: RowCollection, headerView: UIView? = nil, footerView: UIView? = nil)
    {
        self.title = title
        self.rows = rows
        self.headerView = headerView
        self.footerView = footerView
    }
}

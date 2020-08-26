//
//  Section.swift
//  Nightstand
//
//  Created by Tyler Neveldine on 2/8/19.
//

import UIKit

/// The representation of a section in a table view
public class Section
{
    /// The title to appear at the top of the section
    public let title: String?

    /// The rows in the section
    public let rows: RowCollection

    /// Default Initializer
    public init(title: String?, rows: RowCollection)
    {
        self.title = title
        self.rows = rows
    }
}

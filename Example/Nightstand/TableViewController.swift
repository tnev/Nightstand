//
//  TableViewController.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 02/04/2019.
//

import UIKit
import Nightstand

class TableViewController: UIViewController
{
    // MARK: - Properties
    var nightstand: Nightstand
    unowned var coordinator: TableViewCoordinator
    private lazy var tableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Initializers
    public init(coordinator: TableViewCoordinator, sections: [Section])
    {
        self.coordinator = coordinator
        self.nightstand = Nightstand(sections: sections)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupTableView()
    }
}

// MARK: - UI
extension TableViewController
{
    private func setupTableView()
    {
        // Register the necessary cell types
        let cellTypes = [DefaultTableViewCell.self,
                         SubtitleTableViewCell.self,
                         Value1TableViewCell.self,
                         Value2TableViewCell.self,
                         UserTableViewCell.self]
        
        for cellType in cellTypes
        { tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier) }
        
        // Add the tableview as a subview and set constraints
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
            ])

        // Set the data source and delegate to nightstand
        tableView.dataSource = nightstand
        tableView.delegate = nightstand

        // Configure row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
}

// MARK: - Nested Types
extension TableViewController
{
    enum TableType
    {
        case cellChoice
        case defaultTable
        case subtitleTable
        case value1Table
        case value2Table
        case userTable
    }
}


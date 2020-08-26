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

        registerCells()
        setupTableView()
        setupNavigationItem()
    }
}

// MARK: - UI
extension TableViewController
{
    /// Register the necessary cell types
    private func registerCells() {
        let cellTypes = [DefaultTableViewCell.self,
                         SubtitleTableViewCell.self,
                         Value1TableViewCell.self,
                         Value2TableViewCell.self,
                         UserTableViewCell.self]

        for cellType in cellTypes
        { tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier) }
    }

    /// Adds `tableView` to the view hierarchy and sets its constraints, data source, and delegate
    private func setupTableView()
    {
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
    }

    /// Configure navigation item with Nightstand logo
    private func setupNavigationItem() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
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


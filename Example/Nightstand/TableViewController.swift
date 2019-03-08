//
//  TableViewController.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 02/04/2019.
//

import UIKit
import Nightstand

class TableViewController: UIViewController, SectionedTableViewController
{
    // MARK: - Properties
    var sections: [Section] = []
    unowned var coordinator: TableViewCoordinator
    private lazy var tableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Initializers
    public init(coordinator: TableViewCoordinator, sections: [Section])
    {
        self.coordinator = coordinator
        self.sections = sections
        
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
        // Register the appropriate cell types
        let cellTypes = [DefaultTableViewCell.self,
                         SubtitleTableViewCell.self,
                         Value1TableViewCell.self,
                         Value2TableViewCell.self,
                         UserTableViewCell.self]
        
        for cellType in cellTypes
        { tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier) }
        
        // Add the tableview as a subview
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
            ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
}

// MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return cellForRowAt(at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return titleForHeader(in: section)
    }
}

// MARK: - UITableViewDelegate
extension TableViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        didSelectRow(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)
    {
        accessoryButtonTapped(forRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return estimatedHeight(forRowAt: indexPath)
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


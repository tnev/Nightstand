//
//  TableViewSectionFactory.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 2/13/19.
//

import Foundation
import Nightstand

class SectionFactory
{
    /// Cell configurations shared between all Cell Choice cells
    lazy var cellChoiceCellConfiguration: TableViewCellConfiguration =
    {
        var configuration = TableViewCellConfiguration()
        configuration.selectionStyle = .none
        configuration.accessoryType = .detailButton
        return configuration
    }()
}

// MARK: - Sections
extension SectionFactory
{
    func sections(for table: TableViewController.TableType, using coordinator: TableViewCoordinator) -> [Section]
    {
        switch table
        {
        case .cellChoice: return cellChoiceSections(using: coordinator)
        case .defaultTable: return defaultSections()
        case .subtitleTable: return subtitleSections()
        case .value1Table: return value1Sections()
        case .value2Table: return value2Sections()
        case .userTable: return userSections()
        }
    }
    
    private func cellChoiceSections(using coordinator: TableViewCoordinator) -> [Section]
    {
        return [Section(title: "Select a cell to see more",
                        rows: [
                            cellChoiceSectionDefaultRow(coordinator: coordinator),
                            cellChoiceSectionSubtitleRow(coordinator: coordinator),
                            cellChoiceSectionValue1Row(coordinator: coordinator),
                            cellChoiceSectionValue2Row(coordinator: coordinator),
                            cellChoiceSectionUserRow(coordinator: coordinator)
            ])]
    }
}

// MARK: - Cell Choice Cells
extension SectionFactory
{
    private func cellChoiceSectionDefaultRow(coordinator: TableViewCoordinator) -> Row<DefaultTableViewCell>
    {
        let model = DefaultTableViewCell.Model(text: "Default Cells",
                                               image: nil)
        let actions = TableViewCellActions(didSelectCell: { coordinator.navigateTo(.defaultTable) },
                                           didTapAccessoryView: { coordinator.displayAlert(withTitle: "Default Cells") })
        let row = Row<DefaultTableViewCell>(model: model,
                                            actions: actions,
                                            configuration: cellChoiceCellConfiguration)
        return row
    }
    
    private func cellChoiceSectionSubtitleRow(coordinator: TableViewCoordinator) -> Row<SubtitleTableViewCell>
    {
        let model = SubtitleTableViewCell.Model(text: "Subtitle Cells",
                                                detail: nil)
        let actions = TableViewCellActions(didSelectCell: { coordinator.navigateTo(.subtitleTable) },
                                           didTapAccessoryView: { coordinator.displayAlert(withTitle: "Subtitle Cells") })
        let row = Row<SubtitleTableViewCell>(model: model,
                                             actions: actions,
                                             configuration: cellChoiceCellConfiguration)
        return row
    }
    
    private func cellChoiceSectionValue1Row(coordinator: TableViewCoordinator) -> Row<Value1TableViewCell>
    {
        let model = Value1TableViewCell.Model(text: "Value1 Cells",
                                              detail: nil)
        let actions = TableViewCellActions(didSelectCell: { coordinator.navigateTo(.value1Table) },
                                           didTapAccessoryView: { coordinator.displayAlert(withTitle: "Value1 Cells") })
        let row = Row<Value1TableViewCell>(model: model,
                                           actions: actions,
                                           configuration: cellChoiceCellConfiguration)
        return row
    }
    
    private func cellChoiceSectionValue2Row(coordinator: TableViewCoordinator) -> Row<Value2TableViewCell>
    {
        let model = Value2TableViewCell.Model(text: "Value2 Cells",
                                              detail: nil)
        let actions = TableViewCellActions(didSelectCell: { coordinator.navigateTo(.value2Table) },
                                           didTapAccessoryView: { coordinator.displayAlert(withTitle: "Value2 Cells") })
        let row = Row<Value2TableViewCell>(model: model,
                                           actions: actions,
                                           configuration: cellChoiceCellConfiguration)
        return row
    }
    
    private func cellChoiceSectionUserRow(coordinator: TableViewCoordinator) -> Row<UserTableViewCell>
    {
        let model = UserTableViewCell.Model(name: "User Cells",
                                            age: nil,
                                            image: nil)
        let actions = TableViewCellActions(didSelectCell: { coordinator.navigateTo(.userTable) },
                                           didTapAccessoryView: { coordinator.displayAlert(withTitle: "User Cells") })
        let row = Row<UserTableViewCell>(model: model,
                                         actions: actions,
                                         configuration: cellChoiceCellConfiguration)
        return row
    }
}

// MARK: - Specific Cell Sections
extension SectionFactory
{
    private func defaultSections() -> [Section]
    {
        var rows = RowCollection()
        
        for index in 0...100
        {
            let model = DefaultTableViewCell.Model(text: "\(index)", image: UIImage(named: "UserIcon")!)
            rows += [Row<DefaultTableViewCell>(model: model, actions: nil, configuration: nil)]
        }
        
        return [Section(title: "Default Cells", rows: rows)]
    }
    
    private func subtitleSections() -> [Section]
    {
        var rows = RowCollection()
        
        for index in 0...100
        {
            let model = SubtitleTableViewCell.Model(text: "\(index)", detail: "Detail Text")
            rows += [Row<SubtitleTableViewCell>(model: model, actions: nil, configuration: nil)]
        }
        
        return [Section(title: "Subtitle Cells", rows: rows)]
    }
    
    private func value1Sections() -> [Section]
    {
        var rows = RowCollection()
        
        for index in 0...100
        {
            let model = Value1TableViewCell.Model(text: "\(index)", detail: "Detail Text")
            rows += [Row<Value1TableViewCell>(model: model, actions: nil, configuration: nil)]
        }
        
        return [Section(title: "Value 1 Cells", rows: rows)]
    }
    
    private func value2Sections() -> [Section]
    {
        var rows = RowCollection()
        
        for index in 0...100
        {
            let model = Value2TableViewCell.Model(text: "\(index)", detail: "Detail Text")
            rows += [Row<Value2TableViewCell>(model: model, actions: nil, configuration: nil)]
        }
        
        return [Section(title: "Value 2 Cells", rows: rows)]
    }
    
    private func userSections() -> [Section]
    {
        var rows = RowCollection()
        
        for index in 0...100
        {
            let model = UserTableViewCell.Model(name: "Username", age: index, image: UIImage(named: "UserIcon")!)
            rows += [Row<UserTableViewCell>(model: model, actions: nil, configuration: nil)]
        }
        
        return [Section(title: "User Cells (Custom Layout)", rows: rows)]
    }
}

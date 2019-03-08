import Nightstand
import FBSnapshotTestCase
@testable import Nightstand_Example

class SnapshotTests: FBSnapshotTestCase
{
    override func setUp()
    {
        super.setUp()
        
        recordMode = false
    }
    
    func testCellChoiceTable()
    {
        let rootNavigationController = UINavigationController()
        let coordinator = TableViewCoordinator(rootNavigationController: rootNavigationController)
        coordinator.start()
        
        guard let view = coordinator.rootNavigationController.visibleViewController?.view else
        {
            XCTFail("Could not locate the view")
            return
        }
        
        FBSnapshotVerifyView(view)
    }
    
    func testDefaultCellTable()
    {
        let rootNavigationController = UINavigationController()
        let coordinator = TableViewCoordinator(rootNavigationController: rootNavigationController)
        coordinator.navigateTo(.defaultTable)
        
        guard let view = coordinator.rootNavigationController.visibleViewController?.view else
        {
            XCTFail("Could not locate the view")
            return
        }
        
        FBSnapshotVerifyView(view)
    }
    
    func testSubtitleCellTable()
    {
        let rootNavigationController = UINavigationController()
        let coordinator = TableViewCoordinator(rootNavigationController: rootNavigationController)
        coordinator.navigateTo(.subtitleTable)
        
        guard let view = coordinator.rootNavigationController.visibleViewController?.view else
        {
            XCTFail("Could not locate the view")
            return
        }
        
        FBSnapshotVerifyView(view)
    }
    
    func testValue1CellTable()
    {
        let rootNavigationController = UINavigationController()
        let coordinator = TableViewCoordinator(rootNavigationController: rootNavigationController)
        coordinator.navigateTo(.value1Table)
        
        guard let view = coordinator.rootNavigationController.visibleViewController?.view else
        {
            XCTFail("Could not locate the view")
            return
        }
        
        FBSnapshotVerifyView(view)
    }
    
    func testValue2CellTable()
    {
        let rootNavigationController = UINavigationController()
        let coordinator = TableViewCoordinator(rootNavigationController: rootNavigationController)
        coordinator.navigateTo(.value2Table)
        
        guard let view = coordinator.rootNavigationController.visibleViewController?.view else
        {
            XCTFail("Could not locate the view")
            return
        }
        
        FBSnapshotVerifyView(view)
    }
    
    func testUserCellTable()
    {
        let rootNavigationController = UINavigationController()
        let coordinator = TableViewCoordinator(rootNavigationController: rootNavigationController)
        coordinator.navigateTo(.userTable)
        
        guard let view = coordinator.rootNavigationController.visibleViewController?.view else
        {
            XCTFail("Could not locate the view")
            return
        }
        
        FBSnapshotVerifyView(view)
    }
}

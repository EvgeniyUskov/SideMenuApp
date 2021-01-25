//
//  ContainerController.swift
//  SideMenuApp-3
//
//  Created by Evgeniy Uskov on 25.01.2021.
//

import UIKit

//MARK: Protocols
protocol HomeControllerDelegate {
    func handleMenuToggle()
}

protocol MenuControllerDelegate {
    func passData(number: Int)
}

//MARK: ContainerController
class ContainerController: UIViewController {
    
    //MARK: Properties
    var homeController: HomeController!
    var menuController: MenuController!
    var centerController: UIViewController!
    
    var delegate: GestureHandlerDelegate?
    
    var isMenuExpanded = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeController()
    }
    
    //MARK: Setup methods
    private func setupHomeController() {
        homeController = HomeController()
        centerController = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        delegate = homeController
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    private func setupMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    //MARK: Animate methods
    private func showMenuController(shouldExpand: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.centerController.view.frame.origin.x = shouldExpand ?  self.centerController.view.frame.width - 80 : 0
        }
        
    }
    
}

// MARK: HomeControllerDelegate methods
extension ContainerController: HomeControllerDelegate {
    
    func handleMenuToggle() {
        if !isMenuExpanded {
            setupMenuController()
        }
        isMenuExpanded = !isMenuExpanded
        showMenuController(shouldExpand: isMenuExpanded)
        
        delegate?.shouldGesturesWork(isMenuExpanded: isMenuExpanded)
    }
}

// MARK: MenuControllerDelegate methods
extension ContainerController: MenuControllerDelegate {
    func passData(number: Int) {
        homeController.configureLabel(withNumber: number)
        isMenuExpanded = !isMenuExpanded
        showMenuController(shouldExpand: isMenuExpanded)
        delegate?.shouldGesturesWork(isMenuExpanded: isMenuExpanded)
    }
}

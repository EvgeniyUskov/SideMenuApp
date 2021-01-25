//
//  HomeController.swift
//  SideMenuApp-3
//
//  Created by Evgeniy Uskov on 25.01.2021.
//

import UIKit
// MARK: Protocols
protocol GestureHandlerDelegate {
    func shouldGesturesWork(isMenuExpanded: Bool)
}

//MARK: HomeController
class HomeController: UIViewController {
    //MARK: Properties
    var delegate: HomeControllerDelegate?
    
    var isMenuExpanded = false {
        didSet {
            if isMenuExpanded == false {
                removeOverlay()
            }
        }
    }
    
    lazy var label = UILabel.makeVCLabel()
    
    lazy var darkOverlay: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        view.alpha = 0
        return view
    }()
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupNavigationBar()
        setupGestures()
        view.backgroundColor = Constants.Colors.backgroundColor
    }
    
    //MARK: Setup
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBar.getAppearance()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationController?.navigationBar.barTintColor = Constants.Colors.backgroundColor
        navigationController?.navigationBar.tintColor = Constants.Colors.textColor
        navigationItem.title = "Side Menu"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.lefthalf.fill")?.withRenderingMode(.alwaysTemplate) , style: .plain, target: self, action: #selector(handleMenuToggle))
        self.navigationItem.leftBarButtonItem?.tintColor = Constants.Colors.textColor
    }
    
    private func setupLabel() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(tapGesture)
        view.addGestureRecognizer(panGesture)
    }
    
    //MARK: Configure
    func configureLabel(withNumber number: Int?) {
        if let number = number {
            label.text = "\(number)"
        }else {
            label.text = ""
        }
    }
    
    //MARK: Selectors
    @objc
    private func handleMenuToggle () {
        addOverlay()
        delegate?.handleMenuToggle()
    }
    
    @objc
    private func handleTap() {
        if isMenuExpanded {
            delegate?.handleMenuToggle()
        }
    }
    
    @objc
    private func handlePan() {
        if isMenuExpanded {
            delegate?.handleMenuToggle()
        }
    }
   
}

//MARK:GestureHandlerDelegate Imlementation methods
extension HomeController: GestureHandlerDelegate {
    func shouldGesturesWork(isMenuExpanded: Bool) {
        self.isMenuExpanded = isMenuExpanded
    }
}

//MARK: Additional methods
extension HomeController {
    
    func addOverlay() {
        view.addSubview(darkOverlay)
        NSLayoutConstraint.activate([
            darkOverlay.topAnchor.constraint(equalTo: view.topAnchor),
            darkOverlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            darkOverlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkOverlay.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])

        UIView.animate(withDuration: 0.25, animations: {
            self.darkOverlay.alpha = 1
        })
    }
    
    private func removeOverlay() {
        UIView.animate(withDuration: 0.25, animations: {
            self.darkOverlay.alpha = 0
        }) { (_) in
            self.darkOverlay.removeFromSuperview()
        }
    }

}

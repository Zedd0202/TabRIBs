//
//  MainViewController.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewController: UITabBarController, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?
    
    static func create() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MainViewController") as! MainViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
    }
    
    func attachViewControllers(_ viewControllers: [ViewControllable]) {
        self.viewControllers = viewControllers.map { $0.uiviewController }
    }
}

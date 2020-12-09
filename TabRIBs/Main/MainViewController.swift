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
    func moveTo(_ tab: Tab)
}

enum Tab {
    case home
    case blog
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var blogButton: UIButton!
    
    weak var listener: MainPresentableListener?
    
    var viewControllers: [UIViewController] = []
    
    static func create() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MainViewController") as! MainViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        
        self.listener?.moveTo(.home)
    }
    
    @IBAction func homeButtonDidTap(_ sender: Any) {
        self.listener?.moveTo(.home)
    }
    
    @IBAction func blogButtonDidTap(_ sender: Any) {
        self.listener?.moveTo(.blog)
    }
    
    func attachViewControllers(_ viewControllers: [ViewControllable]) {
        self.viewControllers = viewControllers.map { $0.uiviewController }
    }
    
    func moveTo(_ tab: Tab) {
        switch tab {
        case .home:
            let viewController = self.viewControllers.first { $0 is FirstTabViewController }!
            self.addChild(viewController)
            self.containerView.addSubview(viewController.view)
            viewController.view.frame = self.containerView.bounds
            viewController.didMove(toParent: self)
        case .blog:
            let viewController = self.viewControllers.first { $0 is SecondTabViewController }!
            self.addChild(viewController)
            self.containerView.addSubview(viewController.view)
            viewController.view.frame = self.containerView.bounds
            viewController.didMove(toParent: self)
        }
    }
}

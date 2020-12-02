//
//  FirstTabViewController.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift
import UIKit

protocol FirstTabPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class FirstTabViewController: UIViewController, FirstTabPresentable, FirstTabViewControllable {

    weak var listener: FirstTabPresentableListener?
    
    static func create() -> FirstTabViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FirstTabViewController") as! FirstTabViewController
        return viewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        
        self.tabBarItem = UITabBarItem(title: "홈", image: nil, selectedImage: nil)
    }
}

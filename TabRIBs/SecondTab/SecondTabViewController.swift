//
//  SecondTabViewController.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift
import UIKit

protocol SecondTabPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SecondTabViewController: UIViewController, SecondTabPresentable, SecondTabViewControllable {

    weak var listener: SecondTabPresentableListener?
    
    static func create() -> SecondTabViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondTabViewController") as! SecondTabViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        self.tabBarItem = UITabBarItem(title: "블로그", image: nil, selectedImage: nil)
    }
}

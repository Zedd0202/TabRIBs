//
//  PostViewController.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/03.
//

import RIBs
import RxSwift
import UIKit

protocol PostPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func deactivatePost()
}

final class PostViewController: UIViewController, PostPresentable, PostViewControllable {

    weak var listener: PostPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.title = "글뷰"
    }
    
    deinit {
        print("- deinit \(type(of: self))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.listener?.deactivatePost()
    }
}

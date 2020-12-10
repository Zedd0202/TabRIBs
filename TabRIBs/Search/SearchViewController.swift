//
//  SearchViewController.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/10.
//

import RIBs
import RxSwift
import UIKit

protocol SearchPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    var tab: Tab { get }
    func deactivateSearch()
}

final class SearchViewController: UIViewController, SearchPresentable, SearchViewControllable {

    weak var listener: SearchPresentableListener?
    
    static func create() -> SearchViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        return viewController
    }
    
    deinit {
        print("- deinit \(type(of: self))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.listener?.deactivateSearch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        switch self.listener?.tab {
        case .home:
            self.title = "전체 검색"
        case .blog, _:
            self.title = "블로그 검색"
        }
    }
}

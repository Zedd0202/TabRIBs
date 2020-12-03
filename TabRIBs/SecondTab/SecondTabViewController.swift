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

final class SecondTabViewController: UIViewController, SecondTabPresentable, SecondTabViewControllable, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    weak var listener: SecondTabPresentableListener?
    
    static func create() -> SecondTabViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondTabViewController") as! SecondTabViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupTableView()
    }
    
    func setupView() {
        self.view.backgroundColor = .darkGray
        
        self.tabBarItem = UITabBarItem(title: "블로그", image: nil, selectedImage: nil)
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "블로그 - \(indexPath.row)"
        return cell
    }
}

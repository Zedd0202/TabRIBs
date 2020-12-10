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
    func showPost()
    func showSearch()
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
        self.setupNavigation()
        self.setupTableView()
    }
    
    func setupView() {
        self.view.backgroundColor = .darkGray
    }
    
    func setupNavigation() {
        let item = UIBarButtonItem(title: "블로그 검색", image: nil, primaryAction: UIAction(handler: {_  in
            self.listener?.showSearch()
        }), menu: nil)
        self.navigationItem.leftBarButtonItem = item
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.listener?.showPost()
    }
    
    func scrollToTop() {
        self.tableView.setContentOffset(.zero, animated: true)
    }
}

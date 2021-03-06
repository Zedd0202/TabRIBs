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
    func showPost()
    func showSearch()
}

final class FirstTabViewController: UIViewController, FirstTabPresentable, FirstTabViewControllable, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    weak var listener: FirstTabPresentableListener?
    
    static func create() -> FirstTabViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FirstTabViewController") as! FirstTabViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigation()
        self.setupTableView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .brown
    }
    
    func setupNavigation() {
        let item = UIBarButtonItem(title: "검색", image: nil, primaryAction: UIAction(handler: { _  in
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
        cell.textLabel?.text = "홈 - \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.listener?.showPost()
    }
    
    func scrollToTop() {
        self.tableView.setContentOffset(.zero, animated: true)
    }
}

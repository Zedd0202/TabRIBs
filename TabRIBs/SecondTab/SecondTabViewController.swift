//
//  SecondTabViewController.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift
import UIKit
import ReactorKit

protocol SecondTabPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    //var hasAuth: Bool { get }
    var action: ActionSubject<SecondTabInteractor.Action> { get }
    var state: Observable<SecondTabInteractor.State> { get }
    var currentState: SecondTabInteractor.State { get }
    func showPost()
    func showSearch()
}

final class SecondTabViewController: UIViewController, SecondTabPresentable, SecondTabViewControllable, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var listener: SecondTabPresentableListener?
    
    var disposeBag = DisposeBag()
    
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
        self.bind()
        self.listener?.action.onNext(.load)
    }
    
    // MARK: - SecondTabPresentable
    func bind() {
        self.listener?.state.map { $0.hasAuth }
            .subscribe(onNext: { [weak self] in
                // hasAuth가 false -> true로.
                self?.tableView.reloadData()
            }).disposed(by: self.disposeBag)
    }
    
    func setupView() {
        self.view.backgroundColor = .darkGray
    }
    
    func setupNavigation() {
        let item = UIBarButtonItem(title: "블로그 검색", image: nil, primaryAction: UIAction(handler: {_  in
            self.listener?.showSearch()
        }), menu: nil)
        self.navigationItem.rightBarButtonItem = item
        self.title = self.listener?.currentState.hasAuth == true ? "내 블로그" : "다른 사람 블로그"
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
        let title = self.listener?.currentState.hasAuth == true ? "내 글" : "다른 사람 글"
        cell.textLabel?.text = "\(title)-\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.listener?.showPost()
    }
    
    func scrollToTop() {
        self.tableView.setContentOffset(.zero, animated: true)
    }
}

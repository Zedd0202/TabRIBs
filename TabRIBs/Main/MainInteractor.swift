//
//  MainInteractor.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeTo(_ tab: Tab)
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {

    weak var router: MainRouting?
    weak var listener: MainListener?
    
    var currentTab: Tab = .home

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: MainPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func moveTo(_ tab: Tab) {
        self.currentTab = tab
        self.router?.routeTo(tab)
    }
}

//
//  FirstTabInteractor.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift

protocol FirstTabRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func activatePost()
    func deactivatePost()
}

protocol FirstTabPresentable: Presentable {
    var listener: FirstTabPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FirstTabListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func showSearch()
}

final class FirstTabInteractor: PresentableInteractor<FirstTabPresentable>, FirstTabInteractable, FirstTabPresentableListener {
    
    weak var router: FirstTabRouting?
    weak var listener: FirstTabListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: FirstTabPresentable) {
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
    
    func showPost() {
        self.router?.activatePost()
    }
    
    func showSearch() {
        self.listener?.showSearch()
        //self.router?.activateSearch()
    }
    
    func deactivatePost() {
        self.router?.deactivatePost()
    }
    
    func activateBlog() {
        
    }
    
}

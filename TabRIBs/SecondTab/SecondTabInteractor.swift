//
//  SecondTabInteractor.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift

protocol SecondTabRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func activatePost()
    func deactivatePost()
}

protocol SecondTabPresentable: Presentable {
    var listener: SecondTabPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SecondTabListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func showSearch()
}

final class SecondTabInteractor: PresentableInteractor<SecondTabPresentable>, SecondTabInteractable, SecondTabPresentableListener {
   
    weak var router: SecondTabRouting?
    weak var listener: SecondTabListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SecondTabPresentable) {
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
    }
    
    func deactivatePost() {
        self.router?.deactivatePost()
    }
}

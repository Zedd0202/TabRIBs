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
    func activateBlog(hasAuth: Bool)
}

final class SecondTabInteractor: PresentableInteractor<SecondTabPresentable>, SecondTabInteractable, SecondTabPresentableListener {
    
    weak var router: SecondTabRouting?
    weak var listener: SecondTabListener?
    
    var hasAuth: Bool
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SecondTabPresentable, hasAuth: Bool) {
        self.hasAuth = hasAuth
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
    
    func activateBlog() {
        // user.request.
        // 현재 유저의 정보가 interactor안에 있을 테니.
        // 그거 보고 hasAuth결정.
        self.listener?.activateBlog(hasAuth: Bool.random())
    }
}

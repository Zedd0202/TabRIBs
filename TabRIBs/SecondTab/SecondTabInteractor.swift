//
//  SecondTabInteractor.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs
import RxSwift
import ReactorKit

protocol SecondTabRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func activatePost()
    func deactivatePost()
}

protocol SecondTabPresentable: Presentable {
    var listener: SecondTabPresentableListener? { get set }
    var disposeBag: DisposeBag { get set }
    func bind()
    
    var currentState: SecondTabInteractor.State! { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SecondTabListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func showSearch()
    func activateBlog(hasAuth: Bool)
}

final class SecondTabInteractor: PresentableInteractor<SecondTabPresentable>, SecondTabInteractable, SecondTabPresentableListener, Reactor {

    enum Action {
        case load
    }
    
    enum Mutation {
        case setUser
    }
    
    struct State {
        var hasAuth: Bool = false
    }
    
    weak var router: SecondTabRouting?
    weak var listener: SecondTabListener?
    
    var initialState: State

    //var hasAuth: Bool
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SecondTabPresentable) {
        self.initialState = State()
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
    
    func loadUserInfo() {
        self.action.onNext(.load)
    }
    
    func activateBlog() {
        // user.request.
        // 현재 유저의 정보가 interactor안에 있을 테니.
        // 그거 보고 hasAuth결정.
        self.listener?.activateBlog(hasAuth: Bool.random())
    }
}

extension SecondTabInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .load:
            return Observable.just(.setUser)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setUser:
            newState.hasAuth = true
        }
        self.presenter.currentState = newState
        return newState
    }
}

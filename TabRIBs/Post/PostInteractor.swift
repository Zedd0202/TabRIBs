//
//  PostInteractor.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/03.
//

import RIBs
import RxSwift

protocol PostRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol PostPresentable: Presentable {
    var listener: PostPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol PostListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func deactivatePost()
}

final class PostInteractor: PresentableInteractor<PostPresentable>, PostInteractable, PostPresentableListener {
   
    weak var router: PostRouting?
    weak var listener: PostListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: PostPresentable) {
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
    
    func deactivatePost() {
        self.listener?.deactivatePost()
    }

}

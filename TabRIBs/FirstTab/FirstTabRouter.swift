//
//  FirstTabRouter.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol FirstTabInteractable: Interactable, PostListener {
    var router: FirstTabRouting? { get set }
    var listener: FirstTabListener? { get set }
}

protocol FirstTabViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class FirstTabRouter: ViewableRouter<FirstTabInteractable, FirstTabViewControllable>, FirstTabRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    var postBuilder: PostBuildable?
    var postRouting: PostRouting?
    
    init(interactor: FirstTabInteractable, viewController: FirstTabViewControllable, postBuilder: PostBuildable) {
        self.postBuilder = postBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func activatePost() {
        if let postBuilder = self.postBuilder {
            let router = postBuilder.build(withListener: self.interactor)
            self.attachChild(router)
            self.postRouting = router
            self.viewController.push(router.viewControllable)
        }
    }
    
  
    func deactivatePost() {
        if let post = self.postRouting {
            self.detachChild(post)
            self.postRouting = nil
        }
    }
}

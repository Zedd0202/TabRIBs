//
//  PostRouter.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/03.
//

import RIBs

protocol PostInteractable: Interactable {
    var router: PostRouting? { get set }
    var listener: PostListener? { get set }
}

protocol PostViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class PostRouter: ViewableRouter<PostInteractable, PostViewControllable>, PostRouting {
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: PostInteractable, viewController: PostViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func activateBlog() {
        
    }
}

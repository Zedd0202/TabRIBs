//
//  FirstTabRouter.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol FirstTabInteractable: Interactable {
    var router: FirstTabRouting? { get set }
    var listener: FirstTabListener? { get set }
}

protocol FirstTabViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class FirstTabRouter: ViewableRouter<FirstTabInteractable, FirstTabViewControllable>, FirstTabRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: FirstTabInteractable, viewController: FirstTabViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

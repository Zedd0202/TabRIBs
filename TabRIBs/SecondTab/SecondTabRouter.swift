//
//  SecondTabRouter.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol SecondTabInteractable: Interactable {
    var router: SecondTabRouting? { get set }
    var listener: SecondTabListener? { get set }
}

protocol SecondTabViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SecondTabRouter: ViewableRouter<SecondTabInteractable, SecondTabViewControllable>, SecondTabRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SecondTabInteractable, viewController: SecondTabViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

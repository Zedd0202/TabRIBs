//
//  MainRouter.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol MainInteractable: Interactable, FirstTabListener, SecondTabListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func attachViewControllers(_ viewControllers: [ViewControllable])
}

final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {
    
    let firstTabBuilder: FirstTabBuildable?
    let secondTabBuilder: SecondTabBuilder?
    
    var routers: [Routing] = []
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: MainInteractable,
         viewController: MainViewControllable,
         firstTabBuilder: FirstTabBuildable,
         secondTabBuilder: SecondTabBuilder) {
        self.firstTabBuilder = firstTabBuilder
        self.secondTabBuilder = secondTabBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        
        self.activateViewControllers()
    }
    
    func activateViewControllers() {
        if let firstBuilder = self.firstTabBuilder, let secondBuilder = self.secondTabBuilder {
            let firstRouting = firstBuilder.build(withListener: self.interactor)
            let secondRouting = secondBuilder.build(withListener: self.interactor)
            self.attachChild(firstRouting)
            self.attachChild(secondRouting)
            self.viewController.attachViewControllers([
                firstRouting.viewControllable,
                secondRouting.viewControllable
            ])
            self.routers = [firstRouting, secondRouting]
        }
    }
}

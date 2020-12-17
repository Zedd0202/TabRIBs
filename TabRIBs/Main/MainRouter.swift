//
//  MainRouter.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol MainInteractable: Interactable, FirstTabListener, SecondTabListener, SearchListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func attachViewControllers(_ viewControllers: [ViewControllable])
}

final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {
   
    let firstTabBuilder: FirstTabBuildable?
    let secondTabBuilder: SecondTabBuildable?
    let searchBuilder: SearchBuildable?
    
    var searchRouter: SearchRouting?
    
    var routers: [Routing] = []
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: MainInteractable,
         viewController: MainViewControllable,
         firstTabBuilder: FirstTabBuildable,
         secondTabBuilder: SecondTabBuildable,
         searchBuilder: SearchBuildable) {
        self.firstTabBuilder = firstTabBuilder
        self.secondTabBuilder = secondTabBuilder
        self.searchBuilder = searchBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        
        self.activateViewControllers()
    }
    
    func activateViewControllers() {
        if let firstBuilder = self.firstTabBuilder, let secondBuilder = self.secondTabBuilder {
            let firstRouting = firstBuilder.build(withListener: self.interactor)
            let secondRouting = secondBuilder.build(withListener: self.interactor, hasAuth: true)
            self.attachChild(firstRouting)
            self.attachChild(secondRouting)
            self.viewController.attachViewControllers([
                firstRouting.viewControllable,
                secondRouting.viewControllable
            ])
            self.routers = [firstRouting, secondRouting]
        }
    }
    
    func activateSearch(_ tab: Tab) {
        if let searchBuilder = self.searchBuilder {
            let router = searchBuilder.build(withListener: self.interactor, tab: tab)
            self.attachChild(router)
            self.searchRouter = router
            self.viewController.push(router.viewControllable)
        }
    }
    
    func deactivateSearch() {
        if let search = self.searchRouter {
            self.detachChild(search)
            self.searchRouter = nil
        }
    }
    
    func activateBlog(hasAuth: Bool) {
        guard let router = self.secondTabBuilder?.build(withListener: self.interactor, hasAuth: hasAuth) else { return }
        self.attachChild(router)
        self.viewController.push(router.viewControllable)
    }
}

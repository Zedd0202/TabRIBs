//
//  SecondTabRouter.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol SecondTabInteractable: Interactable, PostListener {
    var router: SecondTabRouting? { get set }
    var listener: SecondTabListener? { get set }
}

protocol SecondTabViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SecondTabRouter: ViewableRouter<SecondTabInteractable, SecondTabViewControllable>, SecondTabRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    var postBuilder: PostBuildable?
    
    init(interactor: SecondTabInteractable, viewController: SecondTabViewControllable, postBuilder: PostBuilder) {
        self.postBuilder = postBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func showPost() {
        if let builder = self.postBuilder {
            let router = builder.build(withListener: self.interactor)
            self.attachChild(router)
            viewController.push(router.viewControllable)
        }
        
    }
}

extension ViewControllable {

    func present(_ viewController: ViewControllable, style: UIModalPresentationStyle? = nil, animated: Bool = true) {
        if let style = style {
            viewController.uiviewController.modalPresentationStyle = style
        } else {
            if #available(iOS 13.0, *) {
                viewController.uiviewController.modalPresentationStyle = .automatic
            } else {
                viewController.uiviewController.modalPresentationStyle = .fullScreen
            }
        }
        
        uiviewController.present(viewController.uiviewController, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true) {
        uiviewController.dismiss(animated: animated, completion: nil)
    }
    
    func push(_ viewController: ViewControllable, animated: Bool = true) {
        uiviewController.navigationController?.pushViewController(viewController.uiviewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        uiviewController.navigationController?.popViewController(animated: animated)
    }
    
    func popToViewController(_ viewController: ViewControllable, animated: Bool = true) {
        uiviewController.navigationController?.popToViewController(viewController.uiviewController, animated: animated)
    }
}

extension UIViewController: ViewControllable {
    
}

//
//  SecondTabBuilder.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol SecondTabDependency: PostDependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SecondTabComponent: Component<SecondTabDependency> {

    var hasAuth: Bool
    
    init(dependency: SecondTabDependency, hasAuth: Bool) {
        self.hasAuth = hasAuth
        super.init(dependency: dependency)
    }
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SecondTabBuildable: Buildable {
    func build(withListener listener: SecondTabListener, hasAuth: Bool) -> SecondTabRouting
}

final class SecondTabBuilder: Builder<SecondTabDependency>, SecondTabBuildable {

    override init(dependency: SecondTabDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SecondTabListener, hasAuth: Bool) -> SecondTabRouting {
        let component = SecondTabComponent(dependency: self.dependency, hasAuth: hasAuth)
        let viewController = SecondTabViewController.create()
        let interactor = SecondTabInteractor(presenter: viewController, hasAuth: component.hasAuth)
        interactor.listener = listener
        let postBuilder = PostBuilder(dependency: dependency)
        return SecondTabRouter(interactor: interactor, viewController: viewController, postBuilder: postBuilder)
    }
}

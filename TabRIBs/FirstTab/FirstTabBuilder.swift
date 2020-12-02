//
//  FirstTabBuilder.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol FirstTabDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class FirstTabComponent: Component<FirstTabDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol FirstTabBuildable: Buildable {
    func build(withListener listener: FirstTabListener) -> FirstTabRouting
}

final class FirstTabBuilder: Builder<FirstTabDependency>, FirstTabBuildable {

    override init(dependency: FirstTabDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: FirstTabListener) -> FirstTabRouting {
        let component = FirstTabComponent(dependency: dependency)
        let viewController = FirstTabViewController.create()
        let interactor = FirstTabInteractor(presenter: viewController)
        interactor.listener = listener
        return FirstTabRouter(interactor: interactor, viewController: viewController)
    }
}

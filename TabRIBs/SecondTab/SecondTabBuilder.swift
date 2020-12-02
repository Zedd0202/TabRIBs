//
//  SecondTabBuilder.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol SecondTabDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SecondTabComponent: Component<SecondTabDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SecondTabBuildable: Buildable {
    func build(withListener listener: SecondTabListener) -> SecondTabRouting
}

final class SecondTabBuilder: Builder<SecondTabDependency>, SecondTabBuildable {

    override init(dependency: SecondTabDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SecondTabListener) -> SecondTabRouting {
        let component = SecondTabComponent(dependency: dependency)
        let viewController = SecondTabViewController.create()
        let interactor = SecondTabInteractor(presenter: viewController)
        interactor.listener = listener
        return SecondTabRouter(interactor: interactor, viewController: viewController)
    }
}

//
//  MainBuilder.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/02.
//

import RIBs

protocol MainDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class MainComponent: Component<MainDependency>, FirstTabDependency, SecondTabDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build() -> LaunchRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = MainComponent(dependency: dependency)
        let firstBuilder = FirstTabBuilder(dependency: component)
        let secondBuilder = SecondTabBuilder(dependency: component)
        let viewController = MainViewController()
        let interactor = MainInteractor(presenter: viewController)
        return MainRouter(interactor: interactor,
                          viewController: viewController,
                          firstTabBuilder: firstBuilder,
                          secondTabBuilder: secondBuilder)
    }
}

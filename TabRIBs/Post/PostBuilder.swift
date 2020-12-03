//
//  PostBuilder.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/03.
//

import RIBs

protocol PostDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class PostComponent: Component<PostDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol PostBuildable: Buildable {
    func build(withListener listener: PostListener) -> PostRouting
}

final class PostBuilder: Builder<PostDependency>, PostBuildable {

    override init(dependency: PostDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: PostListener) -> PostRouting {
        let component = PostComponent(dependency: dependency)
        let viewController = PostViewController()
        let interactor = PostInteractor(presenter: viewController)
        interactor.listener = listener
        return PostRouter(interactor: interactor, viewController: viewController)
    }
}

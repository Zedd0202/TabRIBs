//
//  SearchBuilder.swift
//  TabRIBs
//
//  Created by Zedd on 2020/12/10.
//

import RIBs

protocol SearchDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SearchComponent: Component<EmptyComponent> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    fileprivate var tab: Tab
    
    init(tab: Tab) {
        self.tab = tab
        super.init(dependency: EmptyComponent())
    }
}

// MARK: - Builder

protocol SearchBuildable: Buildable {
    func build(withListener listener: SearchListener, tab: Tab) -> SearchRouting
}

final class SearchBuilder: Builder<SearchDependency>, SearchBuildable {

    override init(dependency: SearchDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SearchListener, tab: Tab) -> SearchRouting {
        let component = SearchComponent(tab: tab)
        let viewController = SearchViewController.create()
        let interactor = SearchInteractor(presenter: viewController, tab: component.tab)
        interactor.listener = listener
        return SearchRouter(interactor: interactor, viewController: viewController)
    }
}

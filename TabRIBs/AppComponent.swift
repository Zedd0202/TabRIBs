import RIBs

class AppComponent: Component<EmptyDependency>, MainDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}

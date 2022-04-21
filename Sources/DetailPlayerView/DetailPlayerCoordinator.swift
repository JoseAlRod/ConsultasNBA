import Foundation
import SwiftUI


final class DetailPlayerCoordinator: BaseCoordinator {

    typealias ContentView = DetailPlayerView
    typealias ViewModel = DetailPlayerViewModel
    typealias Interactor = DetailPlayerInteractor
    typealias Provider = DetailPlayerProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }

    static func view(dto: DetailPlayerCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(
            viewModel: ViewModel.self,
            interactor: Interactor.self,
            provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct DetailPlayerCoordinatorDTO {
    
}

import Foundation
import SwiftUI


final class StandingsCoordinator: BaseCoordinator {

    typealias ContentView = StandingsView
    typealias ViewModel = StandingsViewModel
    typealias Interactor = StandingsInteractor
    typealias Provider = StandingsProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }

    static func view(dto: StandingsCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(
            viewModel: ViewModel.self,
            interactor: Interactor.self,
            provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct StandingsCoordinatorDTO {
    
}

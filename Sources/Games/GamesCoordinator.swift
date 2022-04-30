import Foundation
import SwiftUI


final class GamesCoordinator: BaseCoordinator {

    typealias ContentView = GamesView
    typealias ViewModel = GamesViewModel
    typealias Interactor = GamesInteractor
    typealias Provider = GamesProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }

    static func view(dto: GamesCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(
            viewModel: ViewModel.self,
            interactor: Interactor.self,
            provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct GamesCoordinatorDTO {
    
}

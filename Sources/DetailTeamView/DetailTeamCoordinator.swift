import Foundation
import SwiftUI


final class DetailTeamCoordinator: BaseCoordinator {

    typealias ContentView = DetailTeamView
    typealias ViewModel = DetailTeamViewModel
    typealias Interactor = DetailTeamInteractor
    typealias Provider = DetailTeamProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }

    static func view(dto: DetailTeamCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        vip.provider.teamDTO = dto
        vip.viewModel.team = dto?.team
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct DetailTeamCoordinatorDTO {
    var team: TeamsModelView
}

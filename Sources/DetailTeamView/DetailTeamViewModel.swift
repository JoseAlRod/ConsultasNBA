import Foundation

//Output del interactor
protocol DetailTeamInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationPlayersViewModel(data: [PlayersModelView]?)
}

final class DetailTeamViewModel: BaseViewModel, ObservableObject {
    
    // MARK: -Dependedecies injection
    var interactor: DetailTeamInteractorInputProtocol? {
        super.baseInteractor as? DetailTeamInteractorInputProtocol
    }
    
    // MARK: -Variables
    @Published
    var team: TeamsModelView?
    
    @Published
    var selectedSeason: Season = Utils.currentSeason
    
    
    // MARK: -Métodos públicos para View
    
    func fetchData() {
        self.interactor?.fetchDataPlayersInteractor(season: selectedSeason)
    }
    
   
}

//Output del interactor
extension DetailTeamViewModel: DetailTeamInteractorOutputProtocol {
    func setInformationPlayersViewModel(data: [PlayersModelView]?) {
        self.team?.players?.removeAll()
        self.team?.players = data
    }
}

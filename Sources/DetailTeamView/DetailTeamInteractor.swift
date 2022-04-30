import Foundation


//Input del interactor
protocol DetailTeamInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataPlayersInteractor(season: Season)
}

//Output del provider
protocol DetailTeamProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationPlayers(completion: Result<[ResultPlayers]?, NetworkError>)
}

final class DetailTeamInteractor: BaseInteractor {
    
    weak var viewModel: DetailTeamInteractorOutputProtocol? {
        super.baseViewModel as? DetailTeamInteractorOutputProtocol
    }
    
    var provider: DetailTeamProviderInputProtocol? {
        super.baseProvider as? DetailTeamProviderInputProtocol
    }
    
    // Métodos de transformación de modelo de datos
    func transformDataResultToPlayersModelView(data: [ResultPlayers]?) -> [PlayersModelView] {
        var dataSourcePlayersModelView: [PlayersModelView] = []
        if let dataUnw = data {
            for player in dataUnw {
                let object = PlayersModelView(id: player.id,
                                              firstName: player.firstname,
                                              lastName: player.lastname,
                                              height: player.height?.meters,
                                              weight: player.weight?.kilograms,
                                              image: player.image)
                dataSourcePlayersModelView.append(object)
            }
        }
        return dataSourcePlayersModelView
    }
    
}


//Input del interactor
extension DetailTeamInteractor: DetailTeamInteractorInputProtocol {
    func fetchDataPlayersInteractor(season: Season) {
        self.provider?.fetchDataPlayersProvider(season: season)
    }
}

//Output del provider
extension DetailTeamInteractor: DetailTeamProviderOutputProtocol {
    func setInformationPlayers(completion: Result<[ResultPlayers]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationPlayersViewModel(data: self.transformDataResultToPlayersModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}


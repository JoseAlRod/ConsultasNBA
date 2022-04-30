import Foundation


//Input del interactor
protocol GamesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataGamesInteractor()
}

//Output del provider
protocol GamesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationGames(completion: Result<[ResultGames]?, NetworkError>)
}

final class GamesInteractor: BaseInteractor {
    
    weak var viewModel: GamesInteractorOutputProtocol? {
        super.baseViewModel as? GamesInteractorOutputProtocol
    }
    
    var provider: GamesProviderInputProtocol? {
        super.baseProvider as? GamesProviderInputProtocol
    }
    
    // Métodos de transformación de modelo de datos
    
    func transformDataResultToGamesModelView(data: [ResultGames]?) -> [GamesModelView]? {
        var dataSourceGamesModelView: [GamesModelView] = []
        if let dataUnw = data {
            for game in dataUnw {
                let object = GamesModelView(id: game.id,
                                            visitorTeam: TeamsModelView(id: game.teams?.visitors?.id,
                                                                        name: game.teams?.visitors?.name,
                                                                        city: nil,
                                                                        logo: game.teams?.visitors?.logo),
                                            homeTeam: TeamsModelView(id: game.teams?.home?.id,
                                                                     name: game.teams?.home?.name,
                                                                     city: nil,
                                                                     logo: game.teams?.home?.logo),
                                            arena: game.arena?.name)
                dataSourceGamesModelView.append(object)
            }
        }
        return dataSourceGamesModelView
    }
    
}


//Input del interactor
extension GamesInteractor: GamesInteractorInputProtocol {
    func setInformationGames(completion: Result<[ResultGames]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationGamesViewModel(data: self.transformDataResultToGamesModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}

//Output del provider
extension GamesInteractor: GamesProviderOutputProtocol {
    func fetchDataGamesInteractor() {
        self.provider?.fetchDataGamesTodayProvider()
    }
}


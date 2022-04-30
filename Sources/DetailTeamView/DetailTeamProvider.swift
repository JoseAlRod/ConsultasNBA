import Foundation
import Combine

protocol DetailTeamProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataPlayersProvider(season: Season)
}

final class DetailTeamProvider: BaseProvider {
    
    weak var interactor: DetailTeamProviderOutputProtocol? {
        super.baseInteractor as? DetailTeamProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    var teamDTO: DetailTeamCoordinatorDTO?
}

extension DetailTeamProvider: DetailTeamProviderInputProtocol {
    func fetchDataPlayersProvider(season: Season) {
        self.networkService.requestGeneric(payloadRequest: DetailTeamRequestDTO.requestData(id: "\(teamDTO?.team.id ?? 0)", moreParams: "\(season.seasonYear)"), entityClass: PlayersServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationPlayers(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.fetchDataPlayerImageProvider(season: season, resultPlayers: resultData.response)
            }
            .store(in: &cancellable)

    }
    
    private func fetchDataPlayerImageProvider(season: Season, resultPlayers: [ResultPlayers]?) {
        var aux = resultPlayers

        self.networkService.requestGeneric(payloadRequest: PlayersRequest.requestDataPlayers(season: "\(season.seasonYear)"), entityClass: PlayersIdsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    //self?.interactor?.setInformationPlayers(completion: .failure(error))
                    debugPrint("Failed: \(error)")
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                for i in 0...((resultPlayers?.endIndex ?? 0) - 1) {
                    for j in 0...((resultData.league?.standard?.endIndex ?? 0) - 1) {
                        if (resultData.league?.standard?[j].firstName)?.lowercased() == resultPlayers?[i].firstname?.lowercased() && resultData.league?.standard?[j].lastName?.lowercased() == resultPlayers?[i].lastname?.lowercased() {
                            if let personIdUnw = resultData.league?.standard?[j].personId {
                                aux?[i].image = String(format: Utils.urlPlayerImage, personIdUnw)
                                break
                            }
                        }
                    }
                }
                self?.interactor?.setInformationPlayers(completion: .success(aux))

            }
            .store(in: &cancellable)
    }
    
    
}

// MARK: - Support requests
struct DetailTeamRequestDTO {
    static func requestData(id: String, moreParams: String) -> RequestDTO {
        let argument: [CVarArg] = [id, moreParams]
        let urlComplete = String(format: URLEnpoint.endpointPlayersByTeamAndSeason, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}

struct PlayersRequest {
    static func requestDataPlayers(season: String) -> RequestDTO {
        let urlComplete = String(format: URLEnpoint.endpointPlayers, season)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .playersNba)
        return request
    }
}

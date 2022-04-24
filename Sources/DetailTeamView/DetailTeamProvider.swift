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
                self?.interactor?.setInformationPlayers(completion: .success(resultData.response))
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

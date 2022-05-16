import Foundation
import Combine

protocol GamesProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataGamesTodayProvider()
}

final class GamesProvider: BaseProvider {
    
    weak var interactor: GamesProviderOutputProtocol? {
        super.baseInteractor as? GamesProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

extension GamesProvider: GamesProviderInputProtocol {
    func fetchDataGamesTodayProvider() {
        self.networkService.requestGeneric(payloadRequest: GamesRequestDTO.requestData(), entityClass: GamesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationGames(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationGames(completion: .success(resultData.response))
            }
            .store(in: &cancellable)

    }
    
    
}

// MARK: - Support requests
struct GamesRequestDTO {
    static func requestData() -> RequestDTO {
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEnpoint.endpointGamesToday, urlContext: .webService)
        return request
    }
}

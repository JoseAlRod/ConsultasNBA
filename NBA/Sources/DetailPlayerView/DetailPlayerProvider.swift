import Foundation
import Combine

protocol DetailPlayerProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataDetailPlayerProvider()
}

final class DetailPlayerProvider: BaseProvider {
    
    weak var interactor: DetailPlayerProviderOutputProtocol? {
        super.baseInteractor as? DetailPlayerProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    var dataDTO: DetailPlayerCoordinatorDTO?
}

extension DetailPlayerProvider: DetailPlayerProviderInputProtocol {
    func fetchDataDetailPlayerProvider() {
        self.networkService.requestGeneric(payloadRequest: DetailPlayerRequestDTO.requestData(id: "\(dataDTO?.player?.id ?? 0)", team: "\(dataDTO?.team?.id ?? 0)", season: "\(dataDTO?.season?.seasonYear ?? 0)" ), entityClass: DetailPlayerServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationDetailPlayer(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationDetailPlayer(completion: .success(resultData.response))
            }
            .store(in: &cancellable)

    }
    
    
}

// MARK: - Support requests
struct DetailPlayerRequestDTO {
    static func requestData(id: String, team: String, season: String) -> RequestDTO {
        let argument: [CVarArg] = [id, team, season]
        let urlComplete = String(format: URLEnpoint.endpointDetailPlayer, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}

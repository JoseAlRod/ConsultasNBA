import Foundation
import Combine

protocol StandingsProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataStandingsWestProvider()
    func fetchDataStandingsEastProvider()
}

final class StandingsProvider: BaseProvider {
    
    weak var interactor: StandingsProviderOutputProtocol? {
        super.baseInteractor as? StandingsProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

extension StandingsProvider: StandingsProviderInputProtocol {
    func fetchDataStandingsWestProvider() {
        self.networkService.requestGeneric(payloadRequest: StandingsRequestDTO.requestDataWest(), entityClass: StandingsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationStandingsWest(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationStandingsWest(completion: .success(resultData.response))
            }
            .store(in: &cancellable)

    }
    
    func fetchDataStandingsEastProvider() {
        self.networkService.requestGeneric(payloadRequest: StandingsRequestDTO.requestDataEast(), entityClass: StandingsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationStandingsEast(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationStandingsEast(completion: .success(resultData.response))
            }
            .store(in: &cancellable)

    }
    
    
}

// MARK: - Support requests
struct StandingsRequestDTO {
    static func requestDataWest() -> RequestDTO {
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEnpoint.endpointStandingsWest, urlContext: .webService)
        return request
    }
    
    static func requestDataEast() -> RequestDTO {
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEnpoint.endpointStandingsEast, urlContext: .webService)
        return request
    }
}

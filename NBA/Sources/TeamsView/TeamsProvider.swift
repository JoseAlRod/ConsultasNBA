//
//  TeamsProvider.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//

import Foundation
import Combine

protocol TeamsProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataWesternTeamsProvider()
    func fetchDataEasternTeamsProvider()

}

final class TeamsProvider: BaseProvider {
    
    weak var interactor: TeamsProviderOutputProtocol? {
        super.baseInteractor as? TeamsProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

extension TeamsProvider: TeamsProviderInputProtocol {
    func fetchDataWesternTeamsProvider() {
        let request = RequestDTO(params: nil,
                                    method: .get,
                                    endpoint: URLEnpoint.endpointWesternTeams,
                                    urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: TeamsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationWesternTeams(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationWesternTeams(completion: .success(resultData.response))
            }
            .store(in: &cancellable)

    }
    
    func fetchDataEasternTeamsProvider() {
        let request = RequestDTO(params: nil,
                                    method: .get,
                                    endpoint: URLEnpoint.endpointEasternTeams,
                                    urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: TeamsServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationEasternTeams(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationEasternTeams(completion: .success(resultData.response))
            }
            .store(in: &cancellable)

    }
    
  
    
}

import Foundation
import Combine

protocol DetailTeamProviderInputProtocol: BaseProviderInputProtocol {
    

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
//    func fetchDataWesternTeamsProvider() {
//        let request = RequestDTO(params: nil,
//                                    method: .get,
//                                    endpoint: URLEnpoint.endpointWesternTeams,
//                                    urlContext: .webService)
//        self.networkService.requestGeneric(payloadRequest: DetailTeamRequestDTO.requestData(id: "\(dataDTO?.dataId ?? 0)", moreParams: "param1,param2"), entityClass: DetailTeamServerModel.self)
//            .sink { [weak self] completion in
//                guard self != nil else { return }
//                switch completion {
//                case .finished:
//                    debugPrint("finished")
//                case let .failure(error):
//                    self?.interactor?.setInformationWesternTeams(completion: .failure(error))
//                }
//            } receiveValue: { [weak self] resultData in
//                guard self != nil else { return }
//                self?.interactor?.setInformationWesternTeams(completion: .success(resultData.response))
//            }
//            .store(in: &cancellable)
//
//    }
    
    
}

// MARK: - Support requests
struct DetailTeamRequestDTO {
//    static func requestData(id: String, moreParams: String) -> RequestDTO {
//        let argument: [CVarArg] = [id, moreParams]
//        let urlComplete = String(format: URLEnpoint.endpoint, arguments: argument)
//        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
//        return request
//    }
}

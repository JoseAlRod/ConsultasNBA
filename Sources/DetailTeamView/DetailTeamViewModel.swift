import Foundation

//Output del interactor
protocol DetailTeamInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

final class DetailTeamViewModel: BaseViewModel, ObservableObject {
    
    // MARK: -Dependedecies injection
    var interactor: DetailTeamInteractorInputProtocol? {
        super.baseInteractor as? DetailTeamInteractorInputProtocol
    }
    
    // MARK: -Variables
    @Published
    var team: TeamsModelView?
   
    
    // MARK: -Métodos públicos para View
    
   
}

//Output del interactor
extension DetailTeamViewModel: DetailTeamInteractorOutputProtocol {
    
}

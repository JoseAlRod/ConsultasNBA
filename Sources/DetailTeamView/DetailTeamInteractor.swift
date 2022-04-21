import Foundation


//Input del interactor
protocol DetailTeamInteractorInputProtocol: BaseInteractorInputProtocol {
   
}

//Output del provider
protocol DetailTeamProviderOutputProtocol: BaseProviderOutputProtocol {
    
}

final class DetailTeamInteractor: BaseInteractor {
    
    weak var viewModel: DetailTeamInteractorOutputProtocol? {
        super.baseViewModel as? DetailTeamInteractorOutputProtocol
    }
    
    var provider: DetailTeamProviderInputProtocol? {
        super.baseProvider as? DetailTeamProviderInputProtocol
    }
    
    // Métodos de transformación de modelo de datos
    
}


//Input del interactor
extension DetailTeamInteractor: DetailTeamInteractorInputProtocol {
    
}

//Output del provider
extension DetailTeamInteractor: DetailTeamProviderOutputProtocol {
    
}


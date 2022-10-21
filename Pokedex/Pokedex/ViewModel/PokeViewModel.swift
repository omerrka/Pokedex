
import Foundation

protocol PokeViewModelDelegate {
    func callFinished()
}

class PokedexViewModel {
    
    var page = 0
    var pokeData = [Results]()
    var pokeManager = PokeManager()
    var fetchingMore = false
    var delegate : PokeViewModelDelegate?
    init() {}
    
    
    func fetchData() {
        
        self.fetchingMore = true
        
        PokeManager.shared.getData(offset: page) { data in
            if self.page == 0 {
                self.pokeData = data
                
                self.delegate?.callFinished()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
                self.pokeData.append(contentsOf: data)
                self.fetchingMore = false
                
                self.delegate?.callFinished()
            })
        }
        
        page += 20
    }
}




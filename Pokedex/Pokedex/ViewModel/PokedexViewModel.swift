


import Foundation

protocol PokeViewModelDelegate {
    func callFinished()
}


class PokedexViewModel {
    
    var page = 0
    var pokeData = [MyResult]()
    var pokeManager = PokeManager()
    var fetchingMore = false
    var delegate : PokeViewModelDelegate?
    init() {}
    
    func fetchData() {
        
        PokeManager.shared.getData(offset: page) { data in
            self.pokeData = data
            self.delegate?.callFinished()
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
            self.page += 20
            PokeManager.shared.getData(offset: self.page) { data in
                self.pokeData.append(contentsOf: data)
                self.fetchingMore = false

            }
            self.delegate?.callFinished()

            
        })
    }
}

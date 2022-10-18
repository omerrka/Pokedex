
import Foundation

protocol DetailViewModelDelegate {
    func callLaunched()
    func callTypeLaunched()
}


class PokeDetailViewModel {
    
    var detailDelegate: DetailViewModelDelegate?
    var point: String = ""
    var pokeDetailData = [YourResult]()
    var pokeTypeData = String()
    init() {}
    
    func fetchDetailData(point: String) {
        
        
        PokeManager.shared.getDetailData(link: point) { data in
            self.pokeDetailData = data
            self.detailDelegate?.callLaunched()
            
        }
    }

    func fetchTypeData(point: String) {
        
        PokeManager.shared.getTypeData(link: point) { data in
            self.pokeTypeData = data
            self.detailDelegate?.callTypeLaunched()

        }
    }
    
}





    
    


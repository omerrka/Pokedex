
import Foundation

protocol DetailViewModelDelegate {
    func callLaunched()
}


class PokeDetailViewModel {
    
    var detailDelegate: DetailViewModelDelegate?
    var point: String = ""
    var pokeDetailData: PokeStats?
    var pokeTypeData = String()
    //    init() {}
    
    func fetchDetailData(url: String) {
        
        PokeManager.shared.getDetailData(url: url) { data in
            self.pokeDetailData = data
            self.detailDelegate?.callLaunched()
            
        }
    }
}





    
    


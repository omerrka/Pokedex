
import Foundation

class PokeDetailViewModel {
    
    
    var point: String = ""
    var pokeDetailData = [YourResult]()
    init() {}
    
    func fetchDetailData(point: String) {
        
        
        PokeManager.shared.getDetailData(link: point) { data in
            self.pokeDetailData = data
            
        }
    }
}





    
    


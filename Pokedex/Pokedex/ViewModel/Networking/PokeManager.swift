
import Foundation

class PokeManager {
    
    static let shared = PokeManager()
    
    func getData(offset: Int, comp: @escaping ([Results]) -> ()) {
        
        let url = "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=20"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error  in
            
            guard let data = data, error == nil else {
                print("something get wrong")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PokeNames.self, from: data)
                comp(result.results)
                
            } catch {
                print("failed to convert")
            }
            
        }.resume()
    }
    
    func getDetailData(url: String, comp: @escaping (PokeStats) -> ()) {
        
        let url = url
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error  in
            
            guard let data = data, error == nil else {
                print("something get wrong")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PokeStats.self, from: data)
                comp(result)
                
            } catch {
                print("failed to convert")
            }
            
        }.resume()
    }
}

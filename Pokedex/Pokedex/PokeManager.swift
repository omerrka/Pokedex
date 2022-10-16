

import Foundation

class PokeManager {
    
    
    static let shared = PokeManager()
    
    init() {}
    
    func getData(offset: Int, comp : @escaping ([MyResult])->()) {
        
        let url = "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=20"
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error  in
            guard let data = data, error == nil else {
                print("something get wrong")
                return
            }
            
            
            do {
                let result = try JSONDecoder().decode(Response.self, from: data)
                comp(result.results)
                
            }
            catch {
                print("failed to convert")
            }
            
        } .resume()
    }
    
    func getDetailData(link: String, comp : @escaping ([YourResult])->()) {
        
        let url = link
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error  in
            guard let data = data, error == nil else {
                print("something get wrong")
                return
            }
            
            
            do {
                let result = try JSONDecoder().decode(Answer.self, from: data)
                comp(result.stats)
            }
            catch {
                print("failed to convert")
            }
            
            
            
        } .resume()
    }
}

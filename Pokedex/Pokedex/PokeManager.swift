

import Foundation

class PokeManager {
    
    
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
    
    func getDataDetail(urlString: String, comp : @escaping (YourResult)->()) {
        
        let url = "\(urlString)"
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error  in
            guard let data = data, error == nil else {
                print("something get wrong")
                return
            }
            
            
            do {
                let result = try JSONDecoder().decode(Poke.self, from: data)
                comp(result.sprites)
            }
            catch {
                print("failed to convert")
            }
            
            
            
        } .resume()
    }

}



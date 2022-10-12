

import Foundation

class DetailManager {
    
    func getDetailData(number: Int, comp : @escaping ([YourResult])->()) {
        
        let url = "https://pokeapi.co/api/v2/pokemon/\(number)/"
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


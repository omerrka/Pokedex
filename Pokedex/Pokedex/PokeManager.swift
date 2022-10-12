

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
}

//        var pokemons = [YourResult]()
//
//               func loadJSON() {
//
//                let url = "https://pokeapi.co/api/v2/pokemon"
//                guard let urlObj = URL(string: url) else { return }
//
//                URLSession.shared.dataTask(with: urlObj) {(data, response, error) in
//                    guard let data = data else { return }
//
//                    do {
//                        let pokedex = try JSONDecoder().decode(Response.self, from: data)
//
//                        for pokemon in pokedex.results {
//
//                            guard let jsonURL = pokemon.url else { return }
//                            guard let newURL = URL(string: jsonURL) else { return }
//
//                            URLSession.shared.dataTask(with: newURL) {(data, response, error) in
//                                guard let data = data else { return }
//
//                                do {
//                                    let load = try JSONDecoder().decode(YourResult.self, from: data)
//                                    self.pokemons.append(load)
//                                } catch let jsonErr {
//                                    print("Error serializing inner JSON:", jsonErr)
//                                }
//
//                            }.resume()
//                        }
//                    } catch let jsonErr{
//                        print("Error serializing JSON: ", jsonErr)
//                    }
//                }.resume()
//            }
//    }
//
//
//
//
//
//
//
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    var pokemons = [YourResult]()
//
//           func loadJSON() {
//
//            let url = "https://pokeapi.co/api/v2/pokemon"
//            guard let urlObj = URL(string: url) else { return }
//
//            URLSession.shared.dataTask(with: urlObj) {(data, response, error) in
//                guard let data = data else { return }
//
//                do {
//                    let pokedex = try JSONDecoder().decode(Response.self, from: data)
//
//                    for pokemon in pokedex.results {
//
//                        guard let jsonURL = pokemon.url else { return }
//                        guard let newURL = URL(string: jsonURL) else { return }
//
//                        URLSession.shared.dataTask(with: newURL) {(data, response, error) in
//                            guard let data = data else { return }
//
//                            do {
//                                let load = try JSONDecoder().decode(YourResult.self, from: data)
//                                self.pokemons.append(load)
//                            } catch let jsonErr {
//                                print("Error serializing inner JSON:", jsonErr)
//                            }
//
//                        }.resume()
//                    }
//                } catch let jsonErr{
//                    print("Error serializing JSON: ", jsonErr)
//                }
//            }.resume()
//        }
//}

//    func getDataDetail(urlString: String, comp : @escaping (YourResult)->()) {
//
//        let url = "\(urlString)"
//        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error  in
//            guard let data = data, error == nil else {
//                print("something get wrong")
//                return
//            }
//
//
//            do {
//                let result = try JSONDecoder().decode(Poke.self, from: data)
//                comp(result.sprites)
//            }
//            catch {
//                print("failed to convert")
//            }
//
//
//
//        } .resume()
//    }
//
//}

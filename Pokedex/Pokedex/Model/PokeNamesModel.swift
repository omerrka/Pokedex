



import Foundation

struct PokeNames: Codable {
    let results: [MyResult]
    
}


struct MyResult: Codable {
    let name: String
    let url: String
    
    
}



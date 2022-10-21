
import Foundation

struct PokeNames: Codable {
    let results: [Results]
}

struct Results: Codable {
    let name: String
    let url: String
}



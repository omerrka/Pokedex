

import Foundation

struct PokeStats: Codable {
    let stats: [YourResult]
    let types: [LastResult]
}

struct YourResult: Codable {
    let base_stat: Int
    
}

struct LastResult: Codable {
    let slot: Int
    let type: Typee
}

struct Typee : Codable {
    let name: String
    
}

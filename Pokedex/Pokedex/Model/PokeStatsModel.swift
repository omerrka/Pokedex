
import Foundation

struct PokeStats: Codable {
    let stats: [StatsResult]
    let types: [TypesResult]
}

struct StatsResult: Codable {
    let base_stat: Int
}

struct TypesResult: Codable {
    let slot: Int
    let type: Typee
}

struct Typee : Codable {
    let name: String
}

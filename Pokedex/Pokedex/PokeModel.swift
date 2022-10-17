



import Foundation

struct Response: Codable {
    let results: [MyResult]
    
}


struct MyResult: Codable {
    let name: String
    let url: String
    
    
}

struct Answer: Codable {
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

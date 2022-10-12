



import Foundation

struct Response: Codable {
    let results: [MyResult]

}


struct MyResult: Codable {
    let name: String
    let url: String
    

}

struct Poke: Codable {
    let sprites: YourResult
}

struct YourResult: Codable {
    let back_default: String

  
}



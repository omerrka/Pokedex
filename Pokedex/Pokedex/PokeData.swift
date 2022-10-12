



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
}

struct YourResult: Codable {
    let base_stat: Int

  
}



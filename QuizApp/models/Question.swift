import Foundation

struct Question:Codable {
    let question:String?
    var answer:[Answer] = [Answer]()
}

//
//  
//  Created by Luis Perez.
//  © 2025 Luis Perez. All rights reserved.
//
    
struct GetShowDetailsRequest: Encodable {
    let embed: [String]
    
    init(embed: [String] = ["episodes"]) {
        self.embed = embed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if embed.count == 1 {
            try container.encode(embed[0], forKey: .embed)
        } else {
            try container.encode(embed, forKey: .embed)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case embed = "embed[]"
    }
}

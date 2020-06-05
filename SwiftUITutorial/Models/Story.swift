//
//  Story.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//
import SwiftUI

struct Story: Identifiable, Decodable {
    var id: String
    var title: String
    var coverImage: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case coverImage = "cover"
        
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        id  = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        coverImage = try container.decode(String.self, forKey: .coverImage)
        description = try container.decode(String.self, forKey: .description)
    }
    
    init() {
        id = "12345"
        title = "Saim"
        coverImage = "Luffy"
        description = "TEST DES"
    }
}

extension Story {
    static func getTestStory() -> Story {
        return Story()
    }
}


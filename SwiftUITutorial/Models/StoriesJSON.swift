//
//  StoriesJSON.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-05.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import Foundation


struct StoriesJSON: Decodable {
    public let stories: [Story]
    
    enum CodingKeys: String, CodingKey {
        case stories
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stories = try container.decode([Story].self, forKey: .stories)
    }
}

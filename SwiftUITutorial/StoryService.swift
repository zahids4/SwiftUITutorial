//
//  StoryService.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

class StoryService: ObservableObject {

  @Published var stories = [Story]()
     
    init() {
        let url = URL(string: "https://www.wattpad.com/api/v3/stories?offset=0&limit=10&fields=stories(id,title,cover,description)&filter=new")!

        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let storiesData = data {
                    
                    let decodedData = try JSONDecoder().decode(StoriesJSON.self, from: storiesData)
                    
                    DispatchQueue.main.async {
                        self.stories = decodedData.stories
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}

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

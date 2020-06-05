//
//  StoryService.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

class StoryService: ObservableObject {
    /**
     @Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur. SwiftUI will automatically monitor for such changes, and re-invoke the body property of any views that rely on the data. In practical terms, that means whenever an object with a property marked @Published is changed, all views using that object will be reloaded to reflect those changes.
     */
    @Published var stories = [Story]()
    
    func fetchStories() {
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

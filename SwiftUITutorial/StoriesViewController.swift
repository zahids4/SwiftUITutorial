//
//  StoriesViewController.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct StoriesViewController: View {
    @State var stories = [Story]()
    
    func addStory() {
        let story = Story(name: "Newly added Story", description: "This is a newly added story wow cool")
        stories.append(story)
    }
    
    var body: some View {
        return NavigationView {
            List(stories, id: \.id) { story in
                NavigationLink(destination: StoryDetailsViewController(clickedStory: story)) {
                   StoryRow(story: story)
                }
            }
            .navigationBarTitle(Text("Stories"))
            .navigationBarItems(
              trailing: Button(action: addStory,
                               label: { Text("Add Random Story")
                                .fontWeight(.semibold) })
            )
        }.onAppear(perform: {
            self.stories = [Story(name: "After",
                                  imageName: "tanjiro",
                                  description: "Sword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1               boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boi"),
                            Story(name: "Story 2",
                                  description: "Fist boi"),
                            Story(name: "Story 3",
                                  description: "Fist boi 2")]
        })

    }
}
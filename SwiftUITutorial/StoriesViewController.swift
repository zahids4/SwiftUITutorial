//
//  StoriesViewController.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct StoriesViewController: View {
    /**
     When using observed objects there are three key things we need to work with: the ObservableObject protocol is used with some sort of class that can store data, the @ObservedObject property wrapper is used inside a view to store an observable object instance, and the @Published property wrapper is added to any properties inside an observed object that should cause views to update when they change.
     */
    @ObservedObject var service = StoryService()
    
    private func refreshStories() {
        self.service.fetchStories()
    }
    
    var body: some View {
        return NavigationView {
            List(service.stories, id: \.id) { story in
                NavigationLink(destination: StoryDetailsViewController(clickedStory: story)) {
                   StoryRow(story: story)
                }
            }
            .navigationBarTitle(Text("Stories"))
            .navigationBarItems(
              trailing: Button(action: refreshStories,
                               label: { Text("Refresh Stories")
                                .fontWeight(.semibold) })
            )
        }.onAppear(perform: {
            self.service.fetchStories()
        })

    }
}

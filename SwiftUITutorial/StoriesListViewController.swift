//
//  StoriesViewController.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct StoriesListViewController: View {
    /**
     When using observed objects there are three key things we need to work with: the ObservableObject protocol is used with some sort of class that can store data, the @ObservedObject property wrapper is used inside a view to store an observable object instance, and the @Published property wrapper is added to any properties inside an observed object that should cause views to update when they change.
     */
    @ObservedObject var service: StoryService
    
    /**
        Changing background color on list only works if you use ForEach
        using built in iterator ignores the background color
         List(service.stories, id: \.id) { story in
             NavigationLink(destination: StoryDetailsViewController(clickedStory: story)) {
                StoryRow(story: story)
             }
         }
     */
    
    var body: some View {
        return List {
            ForEach(service.stories, id: \.id) { story in
                NavigationLink(destination: StoryDetailsViewController(clickedStory: story)) {
                   StoryRow(story: story)
                }.listRowBackground(Color.black)
            }
            
        }.onAppear(perform: {
            self.service.fetchStories()
        })

    }
}

struct StoriesListViewController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

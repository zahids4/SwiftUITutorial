//
//  StoriesViewController.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct StoriesViewController: View {
    @ObservedObject var service = StoryService()
    @State var stories = [Story]()
    
    func addStory() {
        print("Added")
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
              trailing: Button(action: addStory,
                               label: { Text("Add Random Story")
                                .fontWeight(.semibold) })
            )
        }.onAppear(perform: {

        })

    }
}

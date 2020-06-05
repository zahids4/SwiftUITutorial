//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StoriesViewController()
    }
}

struct StoriesViewController: View {
    @State var stories = [Story]()
    
    func addStory() {
      if let randomStory = stories.randomElement() {
        stories.append(randomStory)
      }
    }
    
    var body: some View {
        return NavigationView {
            List(stories, id: \.id  ) { story in
                StoryRow(story: story)
            }
            .navigationBarTitle(Text("Stories"))
            .navigationBarItems(
              trailing: Button(action: addStory,
                               label: { Text("Add Random Story")
                                .fontWeight(.semibold) })
            )
        }.onAppear(perform: {
            sleep(2)
            self.stories = [Story(name: "After1",
                                  imageName: "tanjiro",
                                  description: "Sword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boiSword1 boi"),
                            Story(name: "I'm a gay wizard",
                                  description: "Fist boi"),
                            Story(name: "Story 3",
                                  description: "Fist boi 2")]
        })

    }
}
struct StoryRow: View {
    var story: Story

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(story.name).font(.largeTitle).bold()
                Image(story.imageName).resizable()
                .frame(width: 200, height: 200)
                Text(story.description)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
            Spacer()
        }
    }
}

struct Story: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String = "Luffy"
    var description: String
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


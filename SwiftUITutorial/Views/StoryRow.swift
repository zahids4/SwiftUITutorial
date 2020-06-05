//
//  StoryRow.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct StoryRow: View {
    var story: Story
    var titleColor: Color = Color.white
    var descriptionColor: Color = Color.white
    
    func getImageView() -> AnyView? {
        guard let url = URL(string: story.coverImage) else {
            return nil
        }
        

        return AnyView(AsyncImage(url: url,
                                  placeholder: Text("Loading ..."),
                                  configuration: { $0.resizable() }).frame(width: 200, height: 200).cornerRadius(10)
        )
    }
    
    /**
     if let, guard let and switch statements are not allowed within var body: some View
     use a mehtod that returns AnyView as an alternative
     
     You are allowed to use if else inside if you you mark the view with @ViewBuilder as follows
     
     @ViewBuilder
     var body: some View {
         if user.isLoggedIn {
             MainView()
         } else {
             LoginView()
         }
     }
     */
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(story.title).font(.largeTitle).bold().foregroundColor(titleColor)
                getImageView()
                Text(story.description)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .foregroundColor(descriptionColor)
            }
            Spacer()
        }
    }
}

struct StoryRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            StoryRow(story: Story.getTestStory())
        }
    }
}

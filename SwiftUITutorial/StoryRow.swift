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

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(story.title).font(.largeTitle).bold()
                Image(story.coverImage).resizable()
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

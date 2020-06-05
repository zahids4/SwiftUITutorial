//
//  File.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct StoryDetailsViewController: View {
    let clickedStory: Story
    
    var body: some View {
        return HStack {
            StoryRow(story: clickedStory)
            Spacer()
        }
    }
}

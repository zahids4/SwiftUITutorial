//
//  File.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct StoryDetailsViewController: View {
    @State private var showingAlert = false
    let clickedStory: Story
    
    var body: some View {
        VStack {
            Text("Click the image!")
            StoryRow(story: clickedStory, titleColor: Color.black, descriptionColor: Color.black).onTapGesture {
                self.showingAlert = true
            }
        }
        /// The $ creates a binding since isPresented takes in Binding<Bool>
        .alert(isPresented: $showingAlert) {
            //Dismissing the alert sets showingAlert back to false
            Alert(title: Text("Important message"), message: Text(""), dismissButton: .default(Text("Got it!")))
        }
    }
}

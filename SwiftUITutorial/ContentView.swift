//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var service = StoryService()
    
    private func refreshStories() {
        self.service.fetchStories()
    }
    
    var body: some View {
        NavigationView {
            StoriesListViewController(service: service)
            .navigationBarTitle(Text("Stories"))
            .navigationBarItems(
                trailing: Button(action: refreshStories,
                                 label: { Text("Refresh Stories").fontWeight(.semibold) })
            )
        }
       
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")

         ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("iPhone XS Max")
      }
   }
}
#endif




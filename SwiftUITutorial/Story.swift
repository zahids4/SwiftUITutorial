//
//  Story.swift
//  SwiftUITutorial
//
//  Created by Saim Zahid on 2020-06-04.
//  Copyright © 2020 Saim Zahid. All rights reserved.
//
import SwiftUI

struct Story: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String = "Luffy"
    var description: String
}


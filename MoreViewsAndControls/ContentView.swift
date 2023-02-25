//
//  ContentView.swift
//  MoreViewsAndControls
//
//  Created by Trung Luu on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    //State value
    @State private var progress = 0.5
    @State private var firstColor = Color.red
    @State private var secondColor = Color.yellow
    @State private var displayText = "Initial Values"
    
    var body: some View {
        List {
            //ProgressViews section
            Section(header: Text("Progress Views")) {
                ProgressView("Intermediate progress view")
                ProgressView("Downloading", value: progress, total: 2)
                Button("More") {
                    if (progress < 2) {
                        progress += 0.5
                    }
                }
            }
            
            //Labels section
            Section(header: Text("Labels")) {
                Label("Slow", systemImage: "tortoise.fill")
                Label(
                    title: {Text("Fast").font(.title)},
                    icon: {
                        Circle().fill(Color.orange)
                            .frame(width: 40, height: 20, alignment: .center)
                            .overlay(Text("F"))
                    }
                )
            }
            
            //ColorPickers section
            Section(header: Text("ColorPickers")) {
                ColorPicker(selection: $firstColor) {
                    Text("Pick Text Color").foregroundColor(firstColor)
                }
                ColorPicker("Picker", selection: $secondColor)
            }
            
            //TextEditors Section
            Section(header: Text("TextEditors")) {
                TextEditor(text: $displayText)
                Text("current editor text: \n\(displayText)")
            }
            
            //Menu Section
            Section(header: Text("Menu")) {
                Menu("Actions") {
                    Button("Set text editor to magic") {
                        displayText = "magic"
                    }
                    Button("Turn first picker green") {
                        firstColor = .green
                    }
                    Menu("Actions") {
                        Button("Set text editor to magic") {
                            displayText = "magic"
                        }
                        Button("Turn first picker green") {
                            firstColor = .green
                        }
                        
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

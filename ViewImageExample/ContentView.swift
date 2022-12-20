//
//  ContentView.swift
//  ViewImageExample
//
//  Created by book on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ImageView(filename:"149x129.jpg")
                .tabItem {
                    Text("149x129 8bpp")
                }
            ImageView(filename:"149x129-24bpp.jpg")
                .tabItem {
                    Text("149x129 24bpp")
                }
            ImageView(filename:"150x130.jpg")
                .tabItem {
                    Text("150x130 8bpp")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

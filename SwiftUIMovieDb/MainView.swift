//
//  MainView.swift
//  SwiftUIMovieDb
//
//  Created by Muhamad Arif on 20/05/22.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
            }
            .tag(0)
            
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(1)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

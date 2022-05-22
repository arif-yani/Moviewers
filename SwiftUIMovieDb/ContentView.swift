//
//  ContentView.swift
//  SwiftUIMovieDb
//
//  Created by Muhamad Arif on 20/05/22.
//

import SwiftUI


struct ContentView: View {
  @AppStorage("isFirstTime") var isFirstTime: Bool = true
    
    var body: some View {
            MainView()
              .fullScreenCover(isPresented: $isFirstTime) {
                    QuistionerView()
               }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  QuistionerView.swift
//  SwiftUIMovieDb
//
//  Created by Muhamad Arif on 20/05/22.
//

import SwiftUI

struct QuistionerView: View {
    
    @State private var isExpanded1 = false
    @State private var favGenre1 : [String] = ["Comedy", "Action", "Horor", "Thriler", "Drama"]
    @State private var selectedGenre1 = "Action"
    
    @State private var isExpanded2 = false
    @State private var favGenre2 : [String] = ["Comedy", "Action", "Horor", "Thriler", "Drama"]
    @State private var selectedGenre2 = "Horor"
    
    @State private var isExpanded3 = false
    @State private var favGenre3 : [String] = ["Comedy", "Action", "Horor", "Thriler", "Drama"]
    @State private var selectedGenre3 = "Drama"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Favorite Genre")
                .font(.largeTitle)
            Text("Favorite 1")
                .font(.title3)
            DisclosureGroup("\(selectedGenre1)", isExpanded: $isExpanded1) {
                VStack {
                    ForEach(favGenre1, id: \.self) { favGenre1 in
                        Text("\(favGenre1)")
                            .font(.title3)
                            .padding(.all)
                            .onTapGesture {
                                self.selectedGenre1 = favGenre1
                                withAnimation {
                                    self.isExpanded1.toggle()
                                }
                            }
                    }
                }
                
            }
            .accentColor(.gray)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.all)
            .background(.white)
            .border(.gray)
            .cornerRadius(8)
            
            Text("Favorite 2")
                .font(.title3)
            DisclosureGroup("\(selectedGenre2)", isExpanded: $isExpanded2) {
                VStack {
                    ForEach(favGenre2, id: \.self) { favGenre2 in
                        Text("\(favGenre2)")
                            .font(.title3)
                            .padding(.all)
                            .onTapGesture {
                                self.selectedGenre2 = favGenre2
                                withAnimation {
                                    self.isExpanded2.toggle()
                                }
                            }
                    }
                }
                
            }
            .accentColor(.gray)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.all)
            .background(.white)
            .border(.gray)
            .cornerRadius(8)
            
            
            Text("Favorite 3")
                .font(.title3)
            DisclosureGroup("\(selectedGenre3)", isExpanded: $isExpanded3) {
                VStack {
                    ForEach(favGenre3, id: \.self) { favGenre3 in
                        Text("\(favGenre3)")
                            .font(.title3)
                            .padding(.all)
                            .onTapGesture {
                                self.selectedGenre3 = favGenre3
                                withAnimation {
                                    self.isExpanded3.toggle()
                                }
                            }
                    }
                }
                
            }
            .accentColor(.gray)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.all)
            .background(.white)
            .border(.gray)
            .cornerRadius(10)
            
            Spacer()
            
            //Button Navigation
//            NavigationLink {
//                MainView()
//            } label: {
//
//            }
//
            Button {
                UserDefaults.standard.set(false, forKey: "isFirstTime")
            } label: {
                buttonSave()
            }

            
            Spacer()
        }.padding(.all)

        
        
    }
}

struct QuistionerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct buttonSave : View {
    var body: some View {
    Text("Save")
            .frame(width: 350, height: 50)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(12)
    }
}

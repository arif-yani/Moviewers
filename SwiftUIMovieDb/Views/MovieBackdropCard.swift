//
//  MovieBackdropCard.swift
//  SwiftUIMovieDb
//
//  Created by Muhamad Arif on 20/05/22.
//

import SwiftUI


struct MovieBackdropCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            Text(movie.title)
                .fontWeight(.black)
            
//            Button(action: {
//              share()
//            }) {
//                Text("Add to Favorite")
//                    .frame(width: 170, height: 30)
//                    .foregroundColor(.white)
//                    .background(.blue)
//            }
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with:
                self.movie.backdropURL)
        }
    }
    
//    func share() {
//        guard let urlShare = URL(string: "https://imdb.com/") else { return }
//        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
//        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true)
//    }
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie)
    }
}





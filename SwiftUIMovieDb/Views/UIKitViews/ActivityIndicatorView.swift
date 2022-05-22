//
//  ActivityIndicatorView.swift
//  SwiftUIMovieDb
//
//  Created by Muhamad Arif on 20/05/22.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}

//
//  MovieServices.swift
//  SwiftUIMovieDb
//
//  Created by Muhamad Arif on 20/05/22.
//

import Foundation
import CoreData
import SwiftUI

protocol MovieService {
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    
}

enum MovieListEndpoint: String, CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self {
        case .nowPlaying: return "Tranding"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rateed"
        case .popular: return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndPoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndPoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

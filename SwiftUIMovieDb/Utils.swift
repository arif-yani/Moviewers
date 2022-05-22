//
//  Utils.swift
//  SwiftUIMovieDb
//
//  Created by Muhamad Arif on 20/05/22.
//

import Foundation

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        jsonDecoder.dataDecodingStrategy = .formatted(dateFormatter)
//        return jsonDecoder
//    }()
//
//    static let dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        return dateFormatter
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd"

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
            return dateFormatter
    }()
    
    
}

//
//  Movie.swift
//  VoteMovie
//
//  Created by Abdhi P (Academy) on 18/05/22.
//

import Foundation
import Messages

struct BaseMovie {
    
    // MARK: Properties
    var titleImage: String?
    var imageUrl: String?
    var votesMovieOne: Int?
    var votesMovieTwo: Int?
    var votesMovieThree: Int?
}

extension BaseMovie {

    // MARK: Initialization

    init?(message: MSMessage?) {
        guard let messageURL = message?.url else { return nil }
        guard let urlComponents = NSURLComponents(url: messageURL, resolvingAgainstBaseURL: false) else { return nil }
        guard let queryItems = urlComponents.queryItems else { return nil }
        self.init(queryItems: queryItems)
    }
    
}

extension BaseMovie {

    // MARK: Computed properties

    /// - Tag: QueryItems
    var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()

        if let part = titleImage {
            items.append(.init(name: "titleImage", value: part))
        }
        if let part = imageUrl {
            items.append(.init(name: "imageUrl", value: part))
        }
        if let part = votesMovieOne {
            items.append(.init(name: "votesMovieOne", value: String(part)))
        }
        if let part = votesMovieTwo {
            items.append(.init(name: "votesMovieTwo", value: String(part)))
        }
        if let part = votesMovieThree {
            items.append(.init(name: "votesMovieThree", value: String(part)))
        }

        return items
    }

    // MARK: Initialization

    init?(queryItems: [URLQueryItem]) {
        var titleImage: String?
        var imageUrl: String?
        var votesMovieOne: Int?
        var votesMovieTwo: Int?
        var votesMovieThree: Int?

        for queryItem in queryItems {
            guard let value = queryItem.value else { continue }

            if queryItem.name == "titleImage" {
                titleImage = value
            }
            if queryItem.name == "imageUrl" {
                imageUrl = value
            }
            if queryItem.name == "votesMovieOne" {
                votesMovieOne = Int(value)
            }
            if queryItem.name == "votesMovieTwo" {
                votesMovieTwo = Int(value)
            }
            if queryItem.name == "votesMovieThree" {
                votesMovieThree = Int(value)
            }
        }

        self.titleImage = titleImage
        self.imageUrl = imageUrl
        self.votesMovieOne = votesMovieOne
        self.votesMovieTwo = votesMovieTwo
        self.votesMovieThree = votesMovieThree
    }
}

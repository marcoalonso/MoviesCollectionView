//
//  UrlTrailer.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 13/11/22.
//

import Foundation

struct UrlTrailer : Codable {
    let id: Int
    let results: [trailers]
}

struct trailers: Codable {
    let key: String
}

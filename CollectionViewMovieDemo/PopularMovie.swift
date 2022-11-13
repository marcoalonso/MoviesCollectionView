//
//  PopularMovie.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 13/11/22.
//

import Foundation

struct PopularMovie: Decodable {
    let page: Int
    let results: [Results]
//    let total_pages: Int
//    let total_resultas: Int
}

struct Results: Decodable {
//    let backdrop_path: String
    let id: Int
    let original_title: String
    let overview: String
    let poster_path: String
//    let release_date: String
}

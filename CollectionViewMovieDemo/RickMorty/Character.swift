//
//  Character.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 15/11/22.
//

import Foundation

struct Character : Codable {
    let results: [Characters]
}

struct Characters: Codable {
    let name: String
    let status: String
    let gender: String
    let image: String
}

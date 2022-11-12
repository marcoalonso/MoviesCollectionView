//
//  MovieCell.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 12/11/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func setup (with movie: Movie){
        movieImageView.image = movie.imagen
        movieTitleLabel.text = movie.titulo
    }
}

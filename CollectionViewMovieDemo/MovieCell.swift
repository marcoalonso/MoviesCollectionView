//
//  MovieCell.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 12/11/22.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    
//    let manager = ManagerMovies()
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func setup (with movie: Results) {
        let urlString = "\(Constants.urlImages)/\(movie.poster_path)"
        guard let url = URL(string: urlString) else { return }
//        fetchImageWithCompetion(urlString: urlString)
        movieImageView.kf.setImage(with: url)
        movieTitleLabel.text = movie.original_title
        movieImageView.layer.cornerRadius = 20
        movieImageView.layer.masksToBounds = true
    }
    
//    func fetchImageWithCompetion(urlString: String) {
//        manager.getImageWithCompletion(urlString: urlString) { [weak self] image, error in
//            DispatchQueue.main.async {
//                self?.movieImageView.image = image
//            }
//        }
//    }
   
}


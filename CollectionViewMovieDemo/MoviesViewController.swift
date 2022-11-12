//
//  ViewController.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 12/11/22.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var collectionMovies: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionMovies.delegate = self
        collectionMovies.dataSource = self
    }


}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.setup(with: movies[indexPath.row])
        return cell
    }
    
    
}

//
//  ViewController.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 12/11/22.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var collectionMovies: UICollectionView!
    
    var manager = ManagerMovies()
    var popularMovies: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegado = self
        manager.getPopularMovies()
        
        
        collectionMovies.delegate = self
        collectionMovies.dataSource = self
        
        collectionMovies.collectionViewLayout = UICollectionViewFlowLayout()
        if let flowLayout = collectionMovies .collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
    }


}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.setup(with: popularMovies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.movieToShow = popularMovies[indexPath.row]
        present(vc, animated: true)
    }
    
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 178, height: 310)
    }
}

extension MoviesViewController: ManagerMoviesProtocol {
    func showMovies(list: [Results]) {
        print("Debug: list Movies \(list[0])")
        popularMovies = list
        DispatchQueue.main.async {
            self.collectionMovies.reloadData()
        }
        
    }
    
    func showError(error: String) {
        print("Debug: error \(error)")
    }
    
    
}

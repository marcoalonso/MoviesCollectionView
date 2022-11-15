//
//  DetailViewController.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 12/11/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var posterPathMovie: UIImageView!
    
    @IBOutlet weak var descripcionMovie: UITextView!
    
    
    var movieToShow: Results?
    var manager = ManagerMovies()
    var idTrailer: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegateTrailer = self
        
        manager.getTrailer(id: movieToShow?.id ?? 0)
        
        setupUI()
       
    }
    
    func setupUI(){
        guard let urlPoster = URL(string: "\(Constants.urlImages)/\(movieToShow!.poster_path)") else { return }
        posterPathMovie.kf.setImage(with: urlPoster)
        print("Debug: descripcion: \(movieToShow?.overview)")
        descripcionMovie.text = movieToShow?.overview
        
    }
    
    @IBAction func verTrailer(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VideoTrailerViewController") as! VideoTrailerViewController
        vc.trailer = idTrailer
        self.present(vc, animated: true)
    }
}

extension DetailViewController: TrailerProtocol {
    func getTrailer(id: String) {
        print("Debug: id Trailer\(id)")
        DispatchQueue.main.async {
            self.idTrailer = id
        }
        
    }
    
    
}

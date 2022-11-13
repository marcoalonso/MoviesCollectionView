//
//  ManagerMovies.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 13/11/22.
//

import Foundation
import UIKit

protocol ManagerMoviesProtocol {
    func showMovies(list: [Results])
    func showError(error: String)
}

protocol TrailerProtocol {
    func getTrailer(id: String)
}

struct ManagerMovies {
    
    var delegado: ManagerMoviesProtocol?
    var delegateTrailer: TrailerProtocol?
    
    func getTrailer(id: Int){
        let urlString = "\(Constants.trailerId)\(id)/videos\(Constants.apiKey)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let _ = response else { return }
            if let trailer = parseJSONTrailer(json: data){
                delegateTrailer?.getTrailer(id: trailer)
            }
        }
        .resume()
    }
    
    func getPopularMovies(){
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=2cfa8720256036601fb9ac4e4bce1a9b&language=es"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let _ = response else { return }
            if let listMovies = parseJSON(json: data){
                delegado?.showMovies(list: listMovies)
            }
        }
        .resume()
    }
    
    func parseJSONTrailer(json: Data) -> String? {
        var urlVideo = ""
        let decoder = JSONDecoder()
        do {
             let data = try decoder.decode(UrlTrailer.self, from: json)
            urlVideo = data.results[0].key
        }catch {
            print("Debug: Error parsing data \(error.localizedDescription)")
            return nil
        }
        return urlVideo
    }
    
    func parseJSON(json: Data) -> [Results]? {
        var listMovies: [Results] = []
        let decoder = JSONDecoder()
        do {
             let data = try decoder.decode(PopularMovie.self, from: json)
            listMovies = data.results
        }catch {
            print("Debug: Error parsing data \(error.localizedDescription)")
            return nil
        }
        return listMovies
    }
    
    func getImageWithCompletion(urlString: String, completionHandler: @escaping(_ image: UIImage?, _ error: Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data),
                  let _ = response else { return }
            completionHandler(image, nil)
        }
        .resume()
    }
    
    
}

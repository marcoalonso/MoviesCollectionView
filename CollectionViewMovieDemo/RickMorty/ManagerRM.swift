//
//  ManagerRM.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 15/11/22.
//

import Foundation

protocol CharacterProtocol {
    func getCharacters(list: [Characters])
}

struct ManagerRM {
    var delegado: CharacterProtocol?
    
    let urlString = "https://rickandmortyapi.com/api/character"
    
    func getPersonajes(){
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(Character.self, from: data)
                let listCharacters = decodedData.results
                delegado?.getCharacters(list: listCharacters)
            }catch {
                print("Debug: Error parsing data \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
    
//    func parseJSON(json: Data) -> [Characters]? {
//        var listCharacters: [Characters] = []
//        let decoder = JSONDecoder()
//        do {
//             let data = try decoder.decode(Character.self, from: json)
//            listCharacters = data.results
//        }catch {
//            print("Debug: Error parsing data \(error.localizedDescription)")
//            return nil
//        }
//        return listCharacters
//    }


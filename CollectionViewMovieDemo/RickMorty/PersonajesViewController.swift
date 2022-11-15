//
//  PersonajesViewController.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 15/11/22.
//

import UIKit

class PersonajesViewController: UIViewController {

    @IBOutlet weak var collectionCharacters: UICollectionView!
    var manager = ManagerRM()
    
    var characters : [Characters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegado = self
        collectionCharacters.delegate = self
        collectionCharacters.dataSource = self
        collectionCharacters.collectionViewLayout = UICollectionViewFlowLayout()
        if let flowLayout = collectionCharacters.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        manager.getPersonajes()
    }
    

}
//EXTENSION
extension PersonajesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 230)
    }
}

extension PersonajesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.setup(with: characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailRMViewController") as! DetailRMViewController
        vc.characterDetail = characters[indexPath.row]
        present(vc, animated: true)
    }
    
    
}
extension PersonajesViewController: CharacterProtocol {
    func getCharacters(list: [Characters]) {
        characters = list
        DispatchQueue.main.async {
            self.collectionCharacters.reloadData()
        }
    }
}

extension UIImageView {

        func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {

        self.image = nil
        //If imageurl's imagename has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        

        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(error)")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                       
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}

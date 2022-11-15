//
//  DetailRMViewController.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 15/11/22.
//

import UIKit

class DetailRMViewController: UIViewController {
    
    var characterDetail: Characters?
    
    @IBOutlet weak var characterImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterImage.contentMode = .scaleToFill

        characterImage.imageFromServerURL(characterDetail!.image, placeHolder: UIImage(named: "morty"))
    }

}

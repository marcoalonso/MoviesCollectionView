//
//  CharacterCell.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 15/11/22.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterGenre: UILabel!
    @IBOutlet weak var characterName: UILabel!
    
    func setup(with character: Characters){
        characterName.text = character.name
        characterGenre.text =  character.gender
        characterStatus.text = character.status
        characterImage.imageFromServerURL(character.image, placeHolder: UIImage(named: "morty"))
        
    }
    
}


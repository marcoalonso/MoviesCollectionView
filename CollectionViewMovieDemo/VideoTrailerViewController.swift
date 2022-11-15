//
//  VideoTrailerViewController.swift
//  CollectionViewMovieDemo
//
//  Created by Marco Alonso Rodriguez on 13/11/22.
//

import UIKit
import youtube_ios_player_helper

class VideoTrailerViewController: UIViewController, YTPlayerViewDelegate {
    @IBOutlet weak var videoTrailerView: YTPlayerView!
    
    var trailer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        videoTrailerView.delegate = self
        
        print("Debug: trailer \(trailer!)")
        videoTrailerView.load(withVideoId: trailer ?? "yd2Go8_cnds")
    }
    

    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        videoTrailerView.playVideo()
    }
}

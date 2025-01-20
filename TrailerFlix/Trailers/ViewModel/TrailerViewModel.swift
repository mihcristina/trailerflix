//
//  TrailerViewModel.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 20/01/25.
//

import AVKit
import Foundation

class TrailerViewModel {

    var player: AVPlayer?
    var playerController: AVPlayerViewController?

    init(view: UIView, trailer: Trailer) {
        prepareLayer(view: view, trailer: trailer)
    }

    func prepareLayer(view: UIView, trailer: Trailer) {
        guard let url = Bundle.main.url(forResource: trailer.url, withExtension: "mp4") else { return }
        player = AVPlayer(url: url)
        playerController = AVPlayerViewController()
        playerController?.player = player
        playerController?.showsPlaybackControls = true
        playerController?.player?.play()
        playerController?.view.frame = view.bounds
        view.addSubview(playerController?.view ?? UIView())
    }

}

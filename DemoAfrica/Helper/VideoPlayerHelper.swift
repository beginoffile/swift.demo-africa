//
//  VideoPlayerHelper.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 03/04/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(filename: String, fileFormat: String) -> AVPlayer{
    if Bundle.main.url(forResource: filename.lowercased(), withExtension: fileFormat) != nil{
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename.lowercased(), withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}

//
//  AudioManager.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import Foundation
import AVKit
import FirebaseStorage

final class AudioManager:ObservableObject {
    
    var player: AVPlayer?

 
  
    
    
    
    @Published var isPlaying:Bool = false{
        didSet{
            print("isPlaying", isPlaying)
        }
    }

    
    var audio: Sound = Sound.testData
   
                                              
    func startPlayer(urlLink: String , isPreview:Bool = false){
        let storage = Storage.storage().reference(forURL: urlLink)
        
        storage.downloadURL { url, error in
            if error != nil{
                print(error)
                return
            } else{
                print(url?.absoluteString)
                self.player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                self.player!.play()
                self.isPlaying = true
                var time = self.player!.currentTime()
                var seconds = CMTimeGetSeconds(time)
                print(seconds)
            }
        }
    }
    
    func playPause() {
        guard let player = player else {
            return
        }
        
        if player.isPlaying {
            player.pause()
            
            self.isPlaying = false
        } else {
            player.play()
            self.isPlaying = true
        }
    }
    
}

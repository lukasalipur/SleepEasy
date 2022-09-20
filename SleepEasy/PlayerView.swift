//
//  PlayerView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import SwiftUI
import FirebaseStorage
import AVKit

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    @ObservedObject var soundVM = SoundViewModel()


    var audio: Sound
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    

    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    

    var body: some View {
        ZStack{
            Image(audio.image)
                .resizable()
                .scaledToFill()
                .frame(width:UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing:32){
                HStack{
                    Button{
                        audioManager.player!.pause()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size:36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding(20)
                
            
                
                Spacer()
                
                Image(audio.image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .shadow(color: Color.black.opacity(0.33), radius: 5, x: 7, y: 7)
                VStack(spacing:0){
                Text(audio.title)
                    .font(.title)
                    .foregroundColor(.white)
                Text(audio.author)
                    .font(.caption)
                    .foregroundColor(.white)
                }
                
                Spacer()
                if let player = audioManager.player{
                VStack(spacing:5){
                    Slider(value: $value, in:0...audio.duration){
                        editing in
                        if !editing {
                            var currentTime = CMTimeGetSeconds((player.currentTime()))
                            player.seek(to: CMTimeMakeWithSeconds(value, preferredTimescale: 1))
                            if player.rate == 0 {
                                print(DateComponentsFormatter.positional.string(from: CMTimeGetSeconds(player.currentTime())))
                            }
                        }
                    }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .accentColor(.white)
                        HStack(spacing:30){
                            Text("\(DateComponentsFormatter.positional.string(from: CMTimeGetSeconds(player.currentTime())) ?? "0:00")")
                            Spacer()
                           Text(getDuration())
                        }
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.horizontal, 30)
                        PlaybackControllButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 40) {
                            audioManager.playPause()
                          
                        }
                    }
                }
            }
     
        .onAppear{
            audioManager.startPlayer(urlLink: audio.track)
            }
        .onReceive(timer) { _ in
            guard let player = audioManager.player else { return }
            value = CMTimeGetSeconds((player.currentTime()))
        }
            
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
              
        }
       
        }

    func getDuration() -> String {
        
        var duration = audioManager.player?.currentItem?.asset.duration
        var getDurationString = DateComponentsFormatter.positional.string(from:CMTimeGetSeconds(duration!))
        
        return getDurationString!
    }
}
    

 
       
  


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(audio: Sound(title: "there is", author: "", duration: 0, image: "", track: "", genre: ""), isPreview:true)
            .environmentObject(AudioManager())
    }
}

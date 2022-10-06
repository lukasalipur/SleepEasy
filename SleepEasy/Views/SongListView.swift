//
//  SongListView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import SwiftUI
import AVKit

struct SongListView: View {
    @ObservedObject var soundVM = SoundViewModel()
    @State private var isFullScreen: Sound? = nil
    
    @EnvironmentObject var audioManager: AudioManager
    @Environment(\.dismiss) var dismiss
    
    var audio: Sound
    
    
    @ObservedObject var genre = FilterGenre.shared
    
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [
                    Color("startBlue"),
                    Color("secondBlue"),
                    Color("thirdBlue"),
                    Color("endBlue")
                ]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
         
            VStack{
                
                HStack{
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size:36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                }.padding(20)
                ScrollView{
                    VStack(spacing:20){
                        ForEach(soundVM.sound, id:\.self) { sound in
                            // For filter
                            if genre.genreFilter == sound.genre{
                                VStack{
                                    
                                    HStack(){
                                        Image("\(sound.image)")
                                            .resizable()
                                            .frame(maxWidth:70, maxHeight:70)
                                            VStack(alignment:.leading){
                                                Text(sound.title)
                                                    .fontWeight(.bold)
                                                Text(sound.author)
                                                    .font(.system(size:9))
                                                    .fontWeight(.light)
                                            }
                                        Spacer()
                                        Text("\(DateComponentsFormatter.positional.string(from:sound.duration) ?? "0:00")")
                                            .font(.system(size:12))
                                            .fontWeight(.light)
                                            .padding(15)
                                    }.onTapGesture{
                                        isFullScreen = sound
                                    }
                                    .frame(maxWidth:.infinity, alignment: .leading)
                                    
                                }
                                
                                .frame(maxWidth:340, maxHeight: 70)
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.33), radius: 5, x: 7, y: 7)
                                
                            }
                        }
                    
                    }
                    .frame(maxWidth:.infinity, maxHeight:.infinity)
                    .fullScreenCover(item:$isFullScreen) { item in
                        PlayerView(audio: item)
                    }
                  
                }
                .foregroundColor(.black)
            }.onAppear {
                self.soundVM.fetchData()
            }
           

            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            }
        }
    }
}
struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(audio: Sound.testData)
        
            .environmentObject(AudioManager())
        
    }
}

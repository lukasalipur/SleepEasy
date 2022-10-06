//
//  MeditationListView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 30.9.22..
//

import SwiftUI

struct MeditationListView: View {
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
            
            Image("zen")
                .position(x:UIScreen.main.bounds.width/2)
            
            VStack(spacing:100){
                
                VStack(){
                    ForEach(soundVM.sound, id:\.self) { sound in
                        if genre.textCase == sound.textCase{
                            Text(sound.text)
                            .foregroundColor(.white)
                            .fontWeight(.light)
                            .font(.system(size:12))
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                       
                    }
                }
                }
                
                VStack{
                    ScrollView{
                        ForEach(soundVM.sound) { sound in
                            if genre.genreFilter == sound.genre{
                                VStack{
                                    MeditationCard(title: sound.title, image: sound.image)
                                        .onTapGesture{
                                            isFullScreen = sound
                                        }
                                }.padding(.horizontal)
                                    .padding(.bottom, 5)
}
                           
                        }
                    }.frame(maxWidth:.infinity)
                }
                .fullScreenCover(item:$isFullScreen) { item in
                    PlayerView(audio: item)
                }
               
                Spacer()
            }
            .onAppear {
                self.soundVM.fetchData()
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Button{
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size:26))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
            .frame(maxWidth:.infinity, maxHeight:.infinity)
        }
        }
    }
}

struct MeditationListView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationListView(audio: Sound.testData)
            .environmentObject(AudioManager())
    }
}

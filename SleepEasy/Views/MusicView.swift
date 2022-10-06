//
//  MusicView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 5.10.22..
//

import SwiftUI

struct MusicView: View {
    var gridItemLayout = [GridItem(.flexible(), spacing:-30), GridItem(.flexible())]
    
    @ObservedObject var soundVM = SoundViewModel()
    @State var isFullScreen: Sound? = nil
    
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
        ScrollView{
           
            LazyVGrid(columns:gridItemLayout, spacing:10){
                ForEach(soundVM.sound, id:\.self) { sound in
                    if sound.isMusic {
                        VStack(alignment:.leading){
                    MediumCardView(title:sound.title, image:sound.image, genre:sound.genre)
                            Text(sound.author).font(.caption)
                        }
                        
            }
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                VStack {
                    Text("Music").font(.system(size:26))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
        .foregroundColor(.white)
        }
            }.onAppear {
                self.soundVM.fetchData()
            }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView( audio: Sound.testData)
    }
}
}

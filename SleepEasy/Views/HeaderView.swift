//
//  HeaderView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 21.9.22..
//

import SwiftUI

struct HeaderView: View {
    @StateObject var genre = FilterGenre.shared
    
    var body: some View {
        ZStack{
            VStack{
            WaveBackgroundView()
                .fill(Color("lightBlue"))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                .frame(height:100)
                Spacer()
            }.ignoresSafeArea()
          
            VStack{
                NavigationLink{SongListView(audio: Sound.testData)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                } label:{
                    BigCardView(title: "Anxiety relief", audioInfo: "7 audio files", image: "night", horizontalLines: 7, genre:self.genre.genreFilter)
                    
                }.simultaneousGesture(TapGesture().onEnded{
                    self.genre.genreFilter = "anxiety"
                })
                    .buttonStyle(PlainButtonStyle())
                
                NavigationLink{SongListView(audio: Sound.testData)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                } label:{
                    BigCardView(title: "Affirmations", audioInfo: "2 audio files", image: "affir", horizontalLines: 2, genre:self.genre.genreFilter)
                    
                }.simultaneousGesture(TapGesture().onEnded{
                    self.genre.genreFilter = "affirmations"
                })
                    .buttonStyle(PlainButtonStyle())
            
        }
            
    }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

//
//  SleepEasyView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 13.9.22..
//

import SwiftUI



struct SleepEasyView: View {
    @StateObject var genre = FilterGenre.shared
    
    var body: some View {
  
  
            NavigationView{
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
        
                NavigationLink{SongListView(audio: Sound.testData)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                       
                } label:{
                    BigCardView(title: "Affirmations", audioInfo: "2 audio files", image: "affir", horizontalLines: 2, genre:self.genre.genreFilter)
                      
                }.simultaneousGesture(TapGesture().onEnded{
                    self.genre.genreFilter = "affirmations"
                })
            }
        }
    }
}

struct SleepEasyView_Previews: PreviewProvider {
    
    static var previews: some View {
        SleepEasyView()
    }
}

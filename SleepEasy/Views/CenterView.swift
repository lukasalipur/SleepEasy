//
//  CenterView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 21.9.22..
//

import SwiftUI

struct CenterView: View {
    @StateObject var genre = FilterGenre.shared
    
    var body: some View {
        VStack(alignment:.leading){
            Text("For you")
                .font(.headline)
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
        
        HStack(spacing:-18){
          
            Spacer()
            NavigationLink{SongListView(audio: Sound.testData)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
            } label:{
                SmallCardView(title: "Breathe", image: "breatheCard", genre:self.genre.genreFilter)
                
            }.simultaneousGesture(TapGesture().onEnded{
                self.genre.genreFilter = "breathe"
            })
                .buttonStyle(PlainButtonStyle())
            Spacer()
            NavigationLink{SongListView(audio: Sound.testData)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
            } label:{
                SmallCardView(title: "Yoga", image: "yogaCard", genre:self.genre.genreFilter)
                
            }.simultaneousGesture(TapGesture().onEnded{
                self.genre.genreFilter = "yoga"
            })
                .buttonStyle(PlainButtonStyle())
            Spacer()
            NavigationLink{SongListView(audio: Sound.testData)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
            } label:{
                SmallCardView(title: "Running", image: "runningCard", genre:self.genre.genreFilter)
                
            }.simultaneousGesture(TapGesture().onEnded{
                self.genre.genreFilter = "running"
            })
                .buttonStyle(PlainButtonStyle())
            Spacer()
        }
        }
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView()
    }
}

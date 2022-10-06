//
//  HomeView.swift
//  HomeView
//
//  Created by Luka Šalipur on 13.9.22..
//

import SwiftUI



struct HomeView: View {
    @StateObject var genre = FilterGenre.shared
    
    var body: some View {
       
           
        NavigationView{
            VStack{
             
                VStack{
                WaveBackgroundView()
                    .frame(height:100)
                    .foregroundColor(Color("waveBg"))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                    .overlay(
                        Text("SleepEasy.")
                            .fontWeight(.bold)
                            .frame(maxWidth:.infinity, maxHeight:.infinity, alignment:.trailing)
                            .padding(.trailing, 20)
                            .font(.system(size:26))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    )
                    NavigationLink{
                        SongListView(audio: Sound.testData)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    } label: {
                BigCardView(title: "Anxiety relief", image: "dock", genre: "anxiety").padding(.top, 100)
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        self.genre.genreFilter = "anxiety"
                    })
                    
                    NavigationLink{
                        SongListView(audio: Sound.testData)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    } label: {
                        BigCardView(title: "Affirmations", image: "affirmations", genre: "affirmations").padding(.top, 20)
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        self.genre.genreFilter = "affirmations"
                    })
                    
              
                }.padding(.bottom, 50)
                HStack(spacing:20){
                    NavigationLink{
                        SongListView(audio: Sound.testData)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    } label: {
                        MediumCardView(title:"Motivation", image:"motivation", genre:"motivation")
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        self.genre.genreFilter = "motivation"
                    })
           
                    NavigationLink{
                        SongListView(audio: Sound.testData)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    } label: {
                        MediumCardView(title: "Breathe", image: "breathe", genre: "breathe")
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        self.genre.genreFilter = "breathe"
                    })
        
                }.foregroundColor(.black)
                Spacer()
            }.ignoresSafeArea()

            
            
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(Color("backgroundGrey"))
   
        }
    }
        
    }


struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}

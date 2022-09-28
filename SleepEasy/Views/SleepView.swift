//
//  SleepView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 24.9.22..
//

import SwiftUI

struct SleepView: View {
    @StateObject var genre = FilterGenre.shared

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
                    
                    
                    Text("WHITE & PINK NOISE")
                        .fontWeight(.bold)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(.leading, 47)
                    
                    NavigationLink{
                        SongListView(audio: Sound.testData)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        
                    } label: {
                        
                        SleepTabCard(image: "wpnoise", imagesmall: "zznight", width: 335, height: 120, genre:self.genre.genreFilter, titleOfSection: "")
                            .padding(.bottom, 20)
                        
                    }.simultaneousGesture(TapGesture().onEnded{
                        self.genre.genreFilter = "wpnoise"
                    })
                    
                    Text("ASMR FOR SLEEP")
                        .fontWeight(.bold)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(.leading, 47)
                    
                    NavigationLink{
                        SongListView(audio: Sound.testData)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        
                    } label: {
                        SleepTabCard(image: "asmr", imagesmall: "", width: 335, height: 120, genre:self.genre.genreFilter, titleOfSection: "")
                        
                        
                    }.simultaneousGesture(TapGesture().onEnded{
                        self.genre.genreFilter = "wpnoise"
                    })
                    Spacer()
                    
                    Text("SOUND OF NATURE")
                        .fontWeight(.bold)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(.leading, 47)
                    
                    HStack(spacing:-75){
                        NavigationLink{
                            SongListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                            
                        } label: {
                            SleepTabCard(image: "mistWood", imagesmall: "", width: 150, height: 150, genre:self.genre.genreFilter, titleOfSection: "")
                            
                            
                        }.simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "wpnoise"
                        })
                        
                        NavigationLink{
                            SongListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                            
                        } label: {
                            SleepTabCard(image: "waterfall", imagesmall: "", width: 150, height: 150, genre:self.genre.genreFilter, titleOfSection: "")
                            
                            
                        }.simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "wpnoise"
                        })
                        
                        
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            VStack {
                                Text("Sleep").font(.system(size:26))
                                    .fontWeight(.bold)
                                    .padding(.leading, 25)
                            }
                        }
                    }
                    Spacer()
                }
            }
            .foregroundColor(.white)
        }
       
      
    }
}



struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}

//
//  MeditationView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 29.9.22..
//

import SwiftUI

struct MeditationView: View {
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
                
                Image("zen")
                    .position(x:UIScreen.main.bounds.width/2)
                VStack(spacing:100){
                    VStack(){
                        
                        Text("\"To let go does not mean to get rid of. To let go means to let be. When we let be with compassion, things come and things go on their own\" – **Jack Kornfield**")
                            .foregroundColor(.white)
                            .fontWeight(.thin)
                            .font(.caption)
                            .padding(.horizontal, 20)
                        
                    }
                    
                    VStack(spacing:20){
                        NavigationLink{
                            MeditationListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)         
                        } label: {
                            MeditationCard(title: "Take a break for a few minutes.", image: "yellowZen")
                             
                        }   .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "mindfulness"
                            self.genre.textCase = "mindfulness"
                        })
                        
                        NavigationLink{
                            MeditationListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            MeditationCard(title: "Om mantra meditation.", image: "om")
                               
                        } .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "anxiety"
                        })
                        
                        NavigationLink{
                            MeditationListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            MeditationCard(title: "Guided meditation, body & spirit connection.", image: "lotus")
                
                             
                            
                        }   .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "anxiety"
                        })
                        
                        NavigationLink{
                            MeditationListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            MeditationCard(title: "Breathe excersise.", image: "smile")
                             
                        }   .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "anxiety"
                        })
                    }
                    Spacer()
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        VStack {
                            Text("Meditate").font(.system(size:26))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                }
                
                .frame(maxWidth:370, maxHeight:.infinity)
                
            }
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}

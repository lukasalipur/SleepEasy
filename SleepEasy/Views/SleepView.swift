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
                    Spacer()
                    VStack{
                        VStack{
                        Text("Meditate")
                            .font(.headline)
                            .foregroundColor(.white)
                        }.frame(maxWidth:325, alignment:.leading)
                            .padding(.bottom, 15)
                        NavigationLink{
                            SongListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            BigCardView(title: "Mindfulness", image: "mindfulness", genre: "mindfulness")
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "sleepmindfulness"
                        })
                        NavigationLink{
                            SongListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            BigCardView(title: "Meditation for ADHD", image: "adhd", genre: "adhd").padding(.top, 20)
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "adhd"
                        })
                       
                     
                    }.padding(.bottom, 30)
                    VStack{
                        Text("Meditate")
                            .font(.headline)
                            .foregroundColor(.white)
                    }.frame(maxWidth:325, alignment:.leading)
                    HStack(spacing:20){
                        NavigationLink{
                            SongListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            MediumCardView(title:"White noise", image:"whiten", genre:"whitenoise")
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "whitenoise"
                        })
                     
                        NavigationLink{
                            SongListView(audio: Sound.testData)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            MediumCardView(title: "Pink noise", image: "pinknoise", genre: "pinknoise")
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.genre.genreFilter = "pinknoise"
                        })
                    
                    }
                   Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        VStack {
                            Text("Sleep").font(.system(size:26))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                }
                .ignoresSafeArea()
                .foregroundColor(.white)

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

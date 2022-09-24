//
//  FooterView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 23.9.22..
//

import SwiftUI

struct FooterView: View {
    var body: some View {
      
       
            
        VStack(alignment:.leading){
            Text("Motivation")
                .font(.headline)
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
            
            HStack(spacing:-17){
                NavigationLink{SongListView(audio: Sound.testData)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                } label:{
                    MediumCardView(title: "Motivational speech", image: "success", genre: "motivationSpeech")
                }
                .buttonStyle(.plain)
                NavigationLink{SongListView(audio: Sound.testData)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                } label:{
                    MediumCardView(title: "Motivational music", image: "headphones", genre: "motivationMusic")
                }.buttonStyle(.plain)
            }
        }
        .ignoresSafeArea()
        
            
    }
}


struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}

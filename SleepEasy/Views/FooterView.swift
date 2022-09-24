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
                .padding(.horizontal, 40)
            HStack{
                NavigationLink{SongListView(audio: Sound.testData)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                } label:{
                    MediumCardView(title: "Motivational speech", image: "success", genre: "motivationSpeech")
                }
                NavigationLink{SongListView(audio: Sound.testData)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                } label:{
                    MediumCardView(title: "Motivational music", image: "headphones", genre: "motivationMusic")
                }
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}

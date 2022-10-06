//
//  MediumCardView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 23.9.22..
//

import SwiftUI

struct MediumCardView: View {
    var title: String
    var image: String
    var genre: String
    
    var body: some View {
        VStack(alignment:.leading){
            VStack{
            ZStack{
                  Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                Rectangle()
                    .frame(width: 150, height: 150)
                    .opacity(0.1)
                }
           
            }.cornerRadius(20)
            Text(title)
        }
    }
}

struct MediumCardView_Previews: PreviewProvider {
    static var previews: some View {
        MediumCardView(title: "Motivation", image: "motivation", genre: "motivation")
    }
}

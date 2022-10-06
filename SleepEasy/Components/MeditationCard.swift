//
//  MeditationCard.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 29.9.22..
//

import SwiftUI

struct MeditationCard: View {
    var title: String
    var image: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width:50, height:50)
                
            }.frame(maxWidth:320, maxHeight:70)
     
                .padding(10)
        }.background(.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.33), radius: 5, x: 7, y: 7)
            

    }
}

struct MeditationCard_Previews: PreviewProvider {
    static var previews: some View {
        MeditationCard(title: "Take a break for 10 minutes.", image: "yellowZen")
    }
}

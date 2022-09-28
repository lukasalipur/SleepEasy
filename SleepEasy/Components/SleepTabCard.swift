//
//  SleepTabCard.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 27.9.22..
//

import SwiftUI

struct SleepTabCard: View {
    var image: String
    var imagesmall: String
    var width: CGFloat
    var height: CGFloat
    var genre: String
    var titleOfSection: String
    var body: some View {
        VStack{
            Text(titleOfSection)
                .fontWeight(.bold)
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading, 47)
                
        ZStack{
       
            Image(image)
                .resizable()
                .scaledToFill()
                .clipped()
            
            Rectangle()
                .opacity(0.15)
            Image(imagesmall)
                .resizable()
                .frame(width:20, height:35)
                .scaledToFit()
                .offset(x:-70, y:-15)
             
            
            Image(systemName:"play.circle")
                .font(.system(size:42))
                .foregroundColor(.white)
        }
        .frame(width:width, height:height)
        .cornerRadius(20)
    }
}
}
struct SleepTabCard_Previews: PreviewProvider {
    static var previews: some View {
        SleepTabCard(image: "wpnoise", imagesmall: "zznight", width: 300, height: 105, genre:"wpnoise", titleOfSection:"WHITE & PINK NOISE")
    }
}

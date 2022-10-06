//
//  BigCardView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 13.9.22..
//

import SwiftUI

struct BigCardView: View {
    var title: String
    var image: String
    var genre: String
    
    var body: some View {
        VStack{
        VStack{
            ZStack{
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .position(x:161, y:35)
                    .frame(width: 325, height: 105)
                    .clipped()
                
                Rectangle()
                    .frame(width: 325, height: 105)
                    .background(Color.black)
                    .opacity(0.05)
                    
              Text(title)
                    .font(.system(size:21))
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
        }.cornerRadius(20)
        }
    }
}

struct BigCardView_Previews: PreviewProvider {
    static var previews: some View {
        BigCardView(title: "Anxiety relief", image: "dock", genre:"affirmations")
    }
}

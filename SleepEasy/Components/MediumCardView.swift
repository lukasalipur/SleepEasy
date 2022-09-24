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
        VStack{
            ZStack{
                VStack{
                    Image(self.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(20)
                }
                .frame(width: 200, height: 200)
            
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                Rectangle()
                    .frame(width: 150, height: 150)
                    .background(.black)
                    .opacity(0.1)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(self.title)
                        .font(.system(size:26))
                }
                .foregroundColor(.white)
                .padding(.top, 70)
                .padding(.horizontal, 10)
            }
            
        }
    }
}

struct MediumCardView_Previews: PreviewProvider {
    static var previews: some View {
        MediumCardView(title: "Motivational speech", image: "success", genre: "motivation")
    }
}

//
//  SmallCardView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 21.9.22..
//

import SwiftUI

struct SmallCardView: View {
    var title: String
    var image: String
    var genre: String
    
    var body: some View {
        VStack(alignment:.leading, spacing:5){
        VStack{
            Image(self.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:95, height:95)
                    .clipped()
            
        }
        .frame(width: 95, height: 95)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
            
            Text(self.title)
                .fontWeight(.light)
        }
        .foregroundColor(.black)
      
       
    }
}

struct SmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardView(title: "Breathe", image: "breatheCard", genre: "breathe")
    }
}

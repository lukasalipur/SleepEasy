//
//  BigCardView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 13.9.22..
//

import SwiftUI





struct BigCardView: View {
    var title: String
    var audioInfo: String
    var image: String
    var horizontalLines: Int
    var genre: String
    
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    Image(self.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 340, height: 100)
                        .clipped()
                }
                
                .frame(width: 340, height: 100)
                .cornerRadius(20)
                
                Rectangle()
                    .frame(width: 340, height: 100)
                    .opacity(0.2)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(self.title)
                        .font(.system(size:26))
                    Text(self.audioInfo)
                        .foregroundColor(.black)
                        .padding(.horizontal, 5)
                        .background(.white)
                        .cornerRadius(5)
                        .padding(.bottom, 5)
                    
                    HStack(spacing:5){
                        ForEach(0..<self.horizontalLines){ _ in
                            Rectangle()
                                .frame(width: 20, height: 3)
                                .background(.white)
                        }
                    }
                    
                }
                .foregroundColor(.white)
                .padding(.bottom, 5)
                
                .padding(20)
                .frame(maxWidth:340, alignment:.topLeading)
                
            }
            
        }
    }
}

struct BigCardView_Previews: PreviewProvider {
    static var previews: some View {
        BigCardView(title: "Anxiety relief", audioInfo: "7 audio files", image: "night", horizontalLines: 7, genre:"affirmations")
    }
}

//
//  SleepEasyView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 13.9.22..
//

import SwiftUI



struct SleepEasyView: View {

    
    var body: some View {
        NavigationView{
            VStack{
                VStack(spacing:50){
         HeaderView()
         CenterView()
                }
                Spacer()
        }
            
        .frame(maxWidth:.infinity, maxHeight: .infinity)
    
        .background(Color("backgroundGrey"))
        }
        
     
    }
}

struct SleepEasyView_Previews: PreviewProvider {
    
    static var previews: some View {
        SleepEasyView()
    }
}

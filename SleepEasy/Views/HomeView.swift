//
//  HomeView.swift
//  HomeView
//
//  Created by Luka Šalipur on 13.9.22..
//

import SwiftUI



struct HomeView: View {

    
    var body: some View {
        
        NavigationView{
            
            VStack{
                VStack(spacing:30){
                    HeaderView()
                    CenterView()
                    FooterView()
                    Spacer()
                } 

            } 
            
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(Color("backgroundGrey"))
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}

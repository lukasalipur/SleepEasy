//
//  ContentView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import SwiftUI


struct ContentView: View {

    @State var currentTab = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    
    
    var body: some View {
    
            TabView(selection:self.$currentTab){
         
                HomeView().tag(0)
                    .tabItem{
                        Image(systemName:"house")
                        Text("Home")
                    }
                
                
                SleepView().tag(1)
                    .tabItem{
                        Image(systemName:"moon")
                        Text("Sleep")
                    }
                
                
                HomeView().tag(2)
                    .tabItem{
                        Image("lotus")
                        Text("Meditate")
                    }
                
                
                HomeView().tag(3)
                    .tabItem{
                        Image(systemName:"music.note")
                        Text("Music")
                    }
                
                
                HomeView().tag(4)
                    .tabItem {
                        Image(systemName:"bell")
                        Text("Reminder")
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}

//
//  ContentView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {

            TabView{
                HomeView()
                    .tabItem{
                        Image(systemName:"house")
                        Text("Home")
                    }
                
                SleepView()
                    .tabItem{
                        Image(systemName:"moon")
                        Text("Sleep")
                    }
                
                HomeView()
                    .tabItem{
                        Image("lotus")
                        Text("Meditate")
                    }
                
                HomeView()
                    .tabItem{
                        Image(systemName:"music.note")
                        Text("Music")
                    }
                
                
                HomeView()
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

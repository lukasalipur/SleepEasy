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
                SleepEasyView()
                    .tabItem{
                        Image(systemName:"house")
                        Text("Home")
                    }
                
                SleepEasyView()
                    .tabItem{
                        Image(systemName:"moon")
                        Text("Sleep")
                    }
                
                SleepEasyView()
                    .tabItem{
                        Image("lotus")
                        Text("Meditate")
                    }
                
                SleepEasyView()
                    .tabItem{
                        Image(systemName:"music.note")
                        Text("Music")
                    }
                
                
                SleepEasyView()
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

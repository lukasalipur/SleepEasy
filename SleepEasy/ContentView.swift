//
//  ContentView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SleepEasyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}

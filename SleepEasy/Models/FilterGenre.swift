//
//  FilterGenre.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 16.9.22..
//

import Foundation

class FilterGenre:ObservableObject {
    static let shared = FilterGenre()
    
    @Published var genreFilter = "none"
}

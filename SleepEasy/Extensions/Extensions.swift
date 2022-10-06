//
//  Extensions.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 13.9.22..
//

import Foundation
import AVKit

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("Initiliazing DataComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
    }()
    
    static let positional: DateComponentsFormatter = {
        print("Initiliazing DataComponentsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}

extension AVPlayer {
    
    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
    
    
    
    }


extension String: Identifiable {
    public var id: String { self }
}

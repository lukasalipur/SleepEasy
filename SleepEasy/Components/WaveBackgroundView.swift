//
//  WaveBackgroundView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 22.9.22..
//

import SwiftUI

struct WaveBackgroundView: Shape {
    func path(in rect:CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x:rect.maxX, y:rect.maxY))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.5, y: rect.maxY * 2.5),
                      control2: CGPoint(x: rect.maxX * 0.50, y: rect.midY * 0.1))
        path.closeSubpath()
       
        return path
    }
}

struct WaveBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        WaveBackgroundView()
            .fill(Color("lightBlue"))
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
            .frame(height:100)
           
    }
}

//
//  NotificationManager.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 6.10.22..
//

import Foundation
import UserNotifications

class NotificationManager{
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error{
                print(error)
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "Hey, would you like some meditation?"
        content.subtitle = "It's time to relax your mind."
        content.sound = .default
        content.badge = 1
        
        var dateComponents = DateComponents()
        
        dateComponents.hour = 21
     

        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) 
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    
    }
}

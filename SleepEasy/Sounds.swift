//
//  Sounds.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import Foundation
import FirebaseFirestore



class SoundViewModel: ObservableObject{
    

   @Published var sound = [Sound]()
    
    private var db = Firestore.firestore()
    func fetchData(){
        db.collection("songs").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("There is no document")
                return
            }
            
            self.sound = documents.map { (queryDocumentSnapshot) -> Sound in
                let data = queryDocumentSnapshot.data()
                
                let title = data["title"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let duration = data["duration"] as? String ?? ""
                let track = data["track"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                
                return Sound(title: title, author: author, duration: duration, image: image, track: track, genre: genre)
            }
        }
    }
}


struct Sound:Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var duration: String
    var image: String
    var track: String
    var genre: String

    static let testData = Sound(title: "Relaxing", author: "Benjamin Tissot", duration: "4:48", image: "relaxing-X2", track: "", genre: "anxiety")
}

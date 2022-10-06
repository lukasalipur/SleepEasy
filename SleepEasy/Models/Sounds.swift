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
                let duration = data["duration"] as? Double ?? 0
                let track = data["track"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                let textCase = data["textCase"] as? String ?? ""
                let text = data["text"] as? String ?? ""
                let isMusic = data["isMusic"] as? Bool ?? false
                
                return Sound(title: title, author: author, duration: duration, image: image, track: track, genre: genre, text:text, textCase: textCase, isMusic: isMusic)
            }
        }
    }
}


struct Sound:Identifiable, Hashable {
    var id = UUID()
    var title: String
    var author: String
    var duration: Double
    var image: String
    var track: String
    var genre: String
    var text: String
    var textCase: String
    var isMusic: Bool

    static let testData = Sound(title: "Relaxing", author: "Benjamin Tissot", duration: 448, image: "relaxing-X2", track: "", genre: "anxiety", text:"In mindfulness meditation, you pay attention to your thoughts as they pass through your mind.   You don’t judge the thoughts or become involved with them.  You simply observe and take note of any patterns.", textCase: "mindfulness", isMusic:true)
}

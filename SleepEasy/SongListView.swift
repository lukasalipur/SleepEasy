//
//  SongListView.swift
//  SleepEasy
//
//  Created by Luka Šalipur on 12.9.22..
//

import SwiftUI


struct SongListView: View {
    @ObservedObject var soundVM = SoundViewModel()
    @State private var isFullScreen:Bool = false
    
    @EnvironmentObject var audioManager: AudioManager
    @Environment(\.dismiss) var dismiss
    
    var audio: Sound
    
   
    @ObservedObject var genre = FilterGenre.shared

    

    
    var body: some View {
        
        NavigationView{
            VStack{
                
                HStack{
                    Button{
//                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size:36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                }.padding(20)
                ScrollView{
                    VStack(spacing:20){
                        ForEach(soundVM.sound) { sound in
                            // For filter
                            if genre.genreFilter == sound.genre{
                          
                                NavigationLink{
                                    PlayerView(audio: sound).navigationBarBackButtonHidden(true)
                                } label: {
                                    VStack{
                                        HStack(){
                                            Image("\(sound.image)")
                                                .resizable()
                                                .frame(maxWidth:70, maxHeight:70)
                                            
                                            VStack(alignment:.leading){
                                                Text(sound.title)
                                                    .fontWeight(.bold)
                                                Text(sound.author)
                                                    .font(.system(size:9))
                                                    .fontWeight(.light)
                                            }
                                            
                                            Spacer()
                                            
                                            Text("\(DateComponentsFormatter.positional.string(from:sound.duration) ?? "0:00")")
                                                .font(.system(size:12))
                                                .fontWeight(.light)
                                                .padding(15)
                                        } .frame(maxWidth:.infinity, alignment: .leading)
                                            .onTapGesture(perform: {
                                                isFullScreen.toggle()
                                            })
                                    }
                                    
                                    .frame(maxWidth:340, maxHeight: 70)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.33), radius: 5, x: 7, y: 7)
                                }.ignoresSafeArea()
                            }
                        }
                    }.frame(maxWidth:.infinity, maxHeight:.infinity)
                }
                .foregroundColor(.black)
            }.onAppear {
                self.soundVM.fetchData()
            }
            .background(Color("backgroundDark"))
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}
struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(audio: Sound.testData)
        
            .environmentObject(AudioManager())
        
    }
}

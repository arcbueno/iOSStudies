//
//  PlaylistView.swift
//  desafiopucpr
//
//  Created by pedro.bueno on 14/09/24.
//

import SwiftUI

struct PlaylistView: View {
    
    var listBody: some View {
        VStack(alignment: .leading){
            HStack{
                HStack{
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Image(systemName: "person.badge.plus.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                Spacer()
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.orange)
            }
            Text("Playlist Maneira")
                .font(.title)
                .fontWeight(.bold)
            Text("Essa playlist é destinada aos melhores Jr. Leaners do Planeta ADDA")
                .font(.headline)
                .fontWeight(.regular)
            HStack{
                Image("foofighters")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 24, height: 24)
                Text("Playlist de Yosda")
                    .bold()
            }
            VStack{
                SongListItem(song: Song(
                    image: "",
                    name: "Dog Days Are Over",
                    artist: "Florence + The Machine",
                    isExplict: false
                ))
                SongListItem(song: Song(
                    image: "",
                    name: "Glasshouses",
                    artist: "Maribou State",
                    isExplict: true
                ))
                SongListItem(song: Song(
                    image: "",
                    name: "Against The Grain",
                    artist: "City and Colour",
                    isExplict: false
                ))
                SongListItem(song: Song(
                    image: "",
                    name: "Homemade Dynamite",
                    artist: "Lorde",
                    isExplict: true
                ))
                SongListItem(song: Song(
                    image: "",
                    name: "Let Go",
                    artist: "LAUREL",
                    isExplict: false
                ))
                SongListItem(song: Song(
                    image: "",
                    name: "Smile",
                    artist: "Wolf Alice",
                    isExplict: false
                ))
                SongListItem(song: Song(
                    image: "",
                    name: "The Kids From Yesterday",
                    artist: "My Chemical Romance",
                    isExplict: false
                ))
            }
        }.padding()
    }
    
        var body: some View {
            GeometryReader { geometry in
    
                ScrollView{
                    VStack {
                        VStack{
                            Image("foofighters")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: geometry.size.height * 0.5)
                                .clipped()
                        }
    
                        listBody
                    }
                }
            }
        }
}



struct SongListItem : View {
    let song: Song
    
    var body: some View {
        HStack{
            Image("foofighters")
                .resizable()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading){
                Text(song.name)
                    .font(.title2)
                    .bold()
                HStack{
                    if(song.isExplict){
                        Image(systemName: "e.square.fill")
                    }
                    Text(song.artist)
                }
            }
            Spacer()
            Image(systemName: "ellipsis")
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}

struct Song {
    let image: String
    let name: String
    let artist: String
    let isExplict: Bool
}



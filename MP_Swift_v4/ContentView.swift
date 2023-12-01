//
//  ContentView.swift
//  MP_Swift_v4
//
//  Created by Nadja on 2023-11-29.
//
/* Moderna uppgift 3 Hämta ett värde från valfritt API. Kan vara från listan med öppna api, något annat eller från exemplet vi använde.
Visa ett eller flera hämtade värde på skärmen.
Lägg upp projektet publikt på GitHub och lägg in länk nedan */

import SwiftUI

struct ContentView: View {
    @StateObject var api = ChuckAPI()
    @State var thejoke = ""
    @State var lookingfor = ""
    @State var titletext = "Chuckles with Chuck"
    @State var queryinfo = "You have been subjected to a randomized Chuck Norris joke" //if the types of jokes change
    @State var urlstring = "https://api.chucknorris.io/jokes/random" //to be able to easily change url in code
    
    
    
    
    var body: some View {
        VStack{
            Spacer()
            Text(titletext)
                .font(.largeTitle)
                .foregroundColor(.brown)
            
            ZStack {
                Image("Prairie")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                
                
                VStack {
                    
                    Spacer()
                    ZStack{
                        Text("")
                            .frame(width: 260, height: 260)
                            .background(.yellow)
                            .cornerRadius(30)
                            .opacity(0.7)
                        
                        Text(api.joketext)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .frame(width: 230, height: 230)
                    }
                    
                    
                    Spacer()
                    
                    Text(queryinfo)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0, height: 50.0)
                        .foregroundColor(.brown)
                    Spacer()
                }
            }
            
            
            .padding()
            
            .onAppear() {
                Task{
                    
                    await api.loadapi(querystring: urlstring)
                    queryinfo = "Another randomized Chuck Norris joke"
                }
                
                
            }
        }
    }
}


#Preview {
    ContentView()
}

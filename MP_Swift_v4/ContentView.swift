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
    @StateObject var apistuff = ChuckAPI()
    @State var thejoke = ""
    @State var lookingfor = ""
    @State var titletext = "Chuckyjokey"
    @State var queryinfo = "This is a randomized Chuck Norris joke"
   
    
    
    
    var body: some View {
       
        VStack {
            Image("Hat")
            Text(titletext)
                .font(.largeTitle)
            
            Text(queryinfo)
                .foregroundColor(Color.orange)
                .padding()
            
            Text(apistuff.joketext)

            
                     
            /*
            Text("Hey, this ain't my first rodeo! Tell me a joke about:")
                .frame(width: 2.0, height: 2.0)
            
             TextField(
            "Enter what to look for",
            text: $lookingfor)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
               
            
            Button(action: {
                
            }, label: {
                Text("Yeehaw")
            }
             
            )
             */
        }
        .padding()
        .onAppear() {
            Task{
                await apistuff.loadapi()
            }
        }
    }
}


#Preview {
    ContentView()
}

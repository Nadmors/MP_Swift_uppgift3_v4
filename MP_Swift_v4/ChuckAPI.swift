//
//  ChuckyAPI.swift
//  MP_Swift_v4
//
//  Created by Nadja on 2023-11-29.
//

import Foundation

struct ChuckJoke : Codable {
    
    var id : String
    var url : String
    var value : String
}

struct searchresult : Codable {
    var total : Int
    var result : [ChuckJoke]
}



class ChuckAPI : ObservableObject {
    
    @Published var joketext = ""
    

   
    func loadapi() async {
        let url = URL(string: "https://api.chucknorris.io/jokes/random")!
        //A Swift let variable is similar to a const variable in other languages, meaning attempting to reassign, reinitialize, or mutate a Swift let variable will cause a compiler error:
        do {
            var (apidata, apiresp) = try await URLSession.shared.data(from: url)
            // Den klagar på att apidata inte ändras, så varför är denna ej definierad som let istället för var?
            print(apidata.count)
            
            let decoder = JSONDecoder()
            
            var thejoke = try decoder.decode(ChuckJoke.self, from: apidata)
            //samma klagomål från xcode, ska det vara en konstant eller en variabel?
            
            print(thejoke.value)
            
            //kommenterade bort detta då borde väl vara enbart för initial felsökning och ej vara kvar?
            
            
            DispatchQueue.main.async {
                self.joketext = thejoke.value
                
                //Asynchronous function returns control to the current queue right after task has been sent to be performed on the different queue. It doesn't wait until the task is finished. It doesn't block the queue.
               
            }
            
        } catch {
            print("Fel vid hämtning")
        }
        
        
    }
}

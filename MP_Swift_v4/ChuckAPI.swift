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
    
    
    
    func loadapi(querystring: String) async {
        let url = URL(string: querystring)!
        //A Swift let variable is similar to a const variable in other languages, meaning attempting to reassign, reinitialize, or mutate a Swift let variable will cause a compiler error:
        do {
            let (apidata, _ ) = try await URLSession.shared.data(from: url)
            // Den klagar på att apidata inte ändras, så varför är denna ej definierad som let istället för var?
            print(apidata.count)
            
            let decoder = JSONDecoder()
            
            let thejoke = try decoder.decode(ChuckJoke.self, from: apidata)
            //samma klagomål från xcode, ska det vara en konstant eller en variabel?
            
            print(thejoke.value)
                     
            
            DispatchQueue.main.async {
                self.joketext = thejoke.value
   
                
                //An asynchronous function returns control to the current queue right after task has been sent to be performed on the different queue. It doesn't wait until the task is finished. It doesn't block the queue.
               
            }
            
        } catch {
            print("Couldn't fetch from API")
        }
        
        
    }
}

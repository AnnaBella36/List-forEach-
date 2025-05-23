//
//  ChatDataSource.swift
//  ForEach
//
//  Created by Olga Dragon on 22.05.2025.
//

import Foundation

struct ChatDataSource {
    
   var loadChats: [Chat] {
       
        let allChats =  [
            Chat(name: "Emily", message: "Hey! How’s it going?", time: "10:30", avatar: "girl"),
            Chat(name: "Mia", message: "Wanna go to the movies?", time: "09:15", avatar: "girl2"),
            Chat(name: "James", message: "Thanks for your help", time: "Yesterday", avatar: "man"),
            Chat(name: "", message: "", time: "", avatar: "man")
        ]
        return allChats.filter{$0.isValid}
    }
}

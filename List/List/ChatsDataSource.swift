//
//  ChatsDataSource.swift
//  List
//
//  Created by Olga Dragon on 23.05.2025.
//

import Foundation

struct ChatsDataSource {
    
    static func loadChats() -> [Chat] {
        return [
            Chat(name: "Emily", message: "Hey! How’s it going?", time: "10:30", avatar: "girl"),
            Chat(name: "Mia", message: "Wanna go to the movies?", time: "09:15", avatar: "girl2"),
            Chat(name: "James", message: "Thanks for your help", time: "Yesterday", avatar: "boy"),
            Chat(name: "", message: "", time: "", avatar: "boy")
        ]
    }
}

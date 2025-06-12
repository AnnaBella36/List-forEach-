//
//  ChatsDataSource.swift
//  List
//
//  Created by Olga Dragon on 23.05.2025.
//

import SwiftUI

class ChatsDataSource: ObservableObject{
    
    @AppStorage("isLoaded") var isLoaded: Bool = false
    @Published var chats: [Chat] = []
    @Published var readStatus: [UUID: Bool] = [:]
    
    init(){
        if isLoaded {
            self.chats = loadChats
        }
    }
    
    func startChatting() {
        isLoaded = true
        chats = loadChats
    }
    
    
    var loadChats: [Chat] {
        
        let allChats = [
            Chat(name: "Emily", message: "Hey! How’s it going?", time: "10:30", avatar: "girl"),
            Chat(name: "Mia", message: "Wanna go to the movies?", time: "09:15", avatar: "girl2"),
            Chat(name: "James", message: "Thanks for your help", time: "Yesterday", avatar: "boy"),
            Chat(name: "", message: "", time: "", avatar: "boy")
        ]
        return allChats.filter{$0.isValid}
    }
    
    
    func deleteChat(id chatID: UUID) {
        chats.removeAll(where: {$0.id == chatID })
    }
    
    func markChatAsRead(_ chat: Chat){
        readStatus[chat.id] = true
    }
    
    func isChatRead(_ chat: Chat) -> Bool{
        readStatus[chat.id] ?? false
    }
}

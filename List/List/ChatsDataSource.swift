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
    @Published var pinnedChatID: UUID? = nil
    private var originalPositions: [UUID: Int] = [:]
    
    init(){
        if isLoaded {
            loadAndIndexChats()
        }
    }
    
    func startChatting() {
        isLoaded = true
        loadAndIndexChats()
    }
    
    private func loadAndIndexChats(){
        self.chats = loadChats
        for(index, chat) in chats.enumerated(){
            originalPositions[chat.id] = index
        }
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
        readStatus.removeValue(forKey: chatID)
        if pinnedChatID == chatID {
            pinnedChatID = nil
        }
    }
    
    func markChatAsRead(_ chat: Chat){
        readStatus[chat.id] = true
    }
    
    func isChatRead(_ chat: Chat) -> Bool{
        readStatus[chat.id] ?? false
    }
    
    func togglePin(chat: Chat) {
        objectWillChange.send()
        pinnedChatID = pinnedChatID == chat.id ? nil : chat.id
    }
    
    var sortedChats: [Chat] {
        if let pinnedID = pinnedChatID,
           let pinnedChat = chats.first(where: { $0.id == pinnedID }) {
            let remainingChats = chats
                .filter { $0.id != pinnedID }
                .sorted {
                    (originalPositions[$0.id] ?? 0) < (originalPositions[$1.id] ?? 0)
                }
            return [pinnedChat] + remainingChats
        } else {
            return chats.sorted {
                (originalPositions[$0.id] ?? 0) < (originalPositions[$1.id] ?? 0)
            }
        }
    }
}

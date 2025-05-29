//
//  ChatsDataSource.swift
//  List
//
//  Created by Olga Dragon on 23.05.2025.
//

import SwiftUI

class ChatsDataSource: ObservableObject{
    
    //MARK: Properties
    @Published var isLoaded: Bool = false
    private let isLoadedKey = "isLoaded"
    
    //MARK: UserDefaults
    init(){
        self.isLoaded = UserDefaults.standard.bool(forKey: isLoadedKey)
    }
    func startChatting(){
        isLoaded = true
        UserDefaults.standard.set(true, forKey: isLoadedKey)
    }
    
    //MARK: filter data
    var loadChats: [Chat] {
        
        let allChats = [
            Chat(name: "Emily", message: "Hey! How’s it going?", time: "10:30", avatar: "girl"),
            Chat(name: "Mia", message: "Wanna go to the movies?", time: "09:15", avatar: "girl2"),
            Chat(name: "James", message: "Thanks for your help", time: "Yesterday", avatar: "boy"),
            Chat(name: "", message: "", time: "", avatar: "boy")
        ]
        return allChats.filter{$0.isValid}
    }
}

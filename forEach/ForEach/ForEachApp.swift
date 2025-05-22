//
//  ForEachApp.swift
//  ForEach
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

@main
struct ForEachApp: App {
    
    let chats = ChatDataSource.loadChats()
    var body: some Scene {
        WindowGroup {
            ChatsView(allChats: chats)
        }
    }
}

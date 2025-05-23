//
//  ListApp.swift
//  List
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

@main
struct ListApp: App {
    let chats = ChatsDataSource()
    var body: some Scene {
        WindowGroup {
            ChatsView(allChats: chats.loadChats)
        }
    }
}

//
//  ContentView.swift
//  List
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct ChatsView: View {
    
    var allChats: [Chat]

    var body: some View {
        
        NavigationView {
            List(allChats) { chat in
             ChatRow(chat: chat)
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
        }
        
    }
}

#Preview {
    let chats = ChatsDataSource()
    ChatsView(allChats: chats.loadChats)
}

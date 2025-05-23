//
//  ContentView.swift
//  ForEach
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct ChatsView: View {
    
    let allChats: [Chat]
    
    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(allChats) { chat in
                    ChatRow(chat: chat)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Chats")
            }
        }
    }
}

#Preview {
    let chats = ChatDataSource()
    ChatsView(allChats: chats.loadChats)
}

//
//  ContentView.swift
//  ForEach
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI
   
    struct ChatsView: View {
        
        let allChats: [Chat]

        var chats: [Chat] {
            allChats.filter {$0.isValid}
        }
        
        var body: some View {
            NavigationView {
               ScrollView{
                ForEach(chats) { chat in
                    ChatRow(chat: chat)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Chats")
            }
            }
        }
    }

#Preview {
    let chats = ChatDataSource.loadChats()
    ChatsView(allChats: chats)
}

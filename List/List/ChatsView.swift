//
//  ContentView.swift
//  List
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct ChatsView: View {
    
    var allChats: [Chat]
    @State private var isloaded = false
    
    var body: some View {
        
        NavigationView {
            if !isloaded{
                InitialView(isLoaded: $isloaded)
            }else{
                List(allChats) { chat in
                    ChatRow(chat: chat)
                    
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Chats")
            }
        }
    }
}

#Preview {
    let chats = ChatsDataSource()
    ChatsView(allChats: chats.loadChats)
}

//
//  ContentView.swift
//  List
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct ChatsView: View {
    
    var allChats: [Chat]
    
    var chats: [Chat]{
        allChats.filter{$0.isValid}
    }
    
    var body: some View {
        
        NavigationView {
            List(chats) { chat in
             ChatRow(chat: chat)
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
        }
        
    }
}

#Preview {
    let chats = ChatsDataSource.loadChats()
    ChatsView(allChats: chats)
}

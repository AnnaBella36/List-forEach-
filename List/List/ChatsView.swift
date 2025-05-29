//
//  ContentView.swift
//  List
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct ChatsView: View {
   @StateObject var viewModel = ChatsDataSource()
    
    var body: some View {
        
        NavigationView {
            if !viewModel.isLoaded{
                InitialView {
                    viewModel.startChatting()
                }
            }else{
                List(viewModel.loadChats) { chat in
                    ChatRow(chat: chat)
                    
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Chats")
            }
        }
    }
}

#Preview {
    ChatsView()
}

//
//  ContentView.swift
//  List
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct ChatsView: View {
    
    @StateObject var viewModel = ChatsDataSource()
    @State private var chatToDelete: Chat? = nil
    @State private var showDeleteConfirmation = false
    
    var body: some View {
        
        NavigationView {
            if !viewModel.isLoaded{
                InitialView {
                    viewModel.startChatting()
                }
            }else{
                List{
                    ForEach(viewModel.sortedChats) { chat in
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            ChatRow(chat: chat)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .cancel) {
                                chatToDelete = chat
                                showDeleteConfirmation = true
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Chats")
                .alert("This chat will be deleted", isPresented: $showDeleteConfirmation, presenting: chatToDelete) { chat in
                    Button("Confirm deletion", role: .destructive) {
                        viewModel.deleteChat(id: chat.id)
                    }
                    Button("Cancel", role: .cancel) {}
                }
                
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ChatsView()
}

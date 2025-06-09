//
//  ChatDetailView.swift
//  List
//
//  Created by Olga Dragon on 09.06.2025.
//

import SwiftUI

struct ChatDetailView: View {
    
    let chat: Chat
    @State private var showAvatarDetail = false
    
    var body: some View {
        VStack{
            ScrollView{
                Text(chat.message.prefix(2000))
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text(chat.name)
                    .font(.headline)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAvatarDetail = true
                } label: {
                    
                    Image(chat.avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
            }
        }
        .sheet(isPresented: $showAvatarDetail) {
            AvatarDetailView(chat: chat)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    var chat = Chat(name: "Emily", message: "What's up? ", time: "11:00", avatar: "girl")
    NavigationView {
        ChatDetailView(chat: chat)
    }
}

//
//  ChatRow.swift
//  List
//
//  Created by Olga Dragon on 18.05.2025.
//

import SwiftUI

struct ChatRow: View{
    
    @EnvironmentObject var viewModel: ChatsDataSource
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 16) {
            Image(chat.avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(chat.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(chat.message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(chat.time)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                if !viewModel.isChatRead(chat) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 10)
                }
            }
        }
        .padding()
        .background(viewModel.pinnedChatID == chat.id ? Color.blue.opacity(0.3) : Color.clear) 
        .onLongPressGesture(minimumDuration: 0.3) {
                 viewModel.togglePin(chat: chat)
             }
    }
    
}

#Preview {
    ChatRow(chat: Chat(name: "Jack", message: "what's up?", time: "11:30", avatar: "boy")).environmentObject(ChatsDataSource())
}

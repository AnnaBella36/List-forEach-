//
//  AvatarDetailView.swift
//  List
//
//  Created by Olga Dragon on 11.06.2025.
//
import SwiftUI

struct AvatarDetailView: View {
    
    var chat: Chat
    
    var body: some View {
        VStack(spacing: 16) {
            Image(chat.avatar)
                .resizable()
                .aspectRatio(1,contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding()
            Text(chat.name)
                .font(.title2)
                .bold()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let chat = Chat(name: "Emily", message: "What's up ?", time: "11:30", avatar: "girl2")
    NavigationView {
        ChatDetailView(chat: chat)
    }
}

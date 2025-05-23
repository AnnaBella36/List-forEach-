//
//  ChatRow.swift
//  ForEach
//
//  Created by Olga Dragon on 18.05.2025.
//

import SwiftUI

struct ChatRow: View {
    
    let chat: Chat

    var body: some View {
        HStack() {
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

            Text(chat.time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    ChatRow(chat: Chat(name: "Jack", message: "what's up?", time: "11:30", avatar: "man"))
}

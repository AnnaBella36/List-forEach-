//
//  ContentView.swift
//  List
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct Chat: Identifiable{
    let id = UUID()
    let name: String
    let message: String
    let time: String
    let avatar: String
}

struct ContentView: View {
    let chats = [
        Chat(name: "Иван", message: "Привет! Как дела?", time: "10:30", avatar: "a"),
        Chat(name: "Мария", message: "Пошли в кино?", time: "09:15", avatar: "c"),
        Chat(name: "Анна", message: "Спасибо за помощь!", time: "Вчера", avatar: "d")
    ]
    
    var body: some View {
        NavigationView {
            List(chats) { chat in
                HStack(spacing: 16){
                    Image(chat.avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(chat.name)
                            .font(.headline)
                        Text(chat.message)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    Text(chat.time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Чаты")
        }
        
    }
}

#Preview {
    ContentView()
}

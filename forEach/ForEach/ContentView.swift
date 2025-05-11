//
//  ContentView.swift
//  ForEach
//
//  Created by Olga Dragon on 07.05.2025.
//

import SwiftUI

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let time: String
    let avatar: String
}

struct ContentView: View {
    let chats: [Chat] = [
        Chat(name: "Иван", message: "Ты где?", time: "10:32", avatar: "a"),
        Chat(name: "Мария", message: "Скинь видео", time: "09:45", avatar: "c"),
        Chat(name: "Анна", message: "Всё готово", time: "15:12", avatar: "d")
    ]
    

    var body: some View {
        NavigationView {
            HStack(spacing: 16) {
                ScrollView{
                    ForEach(chats) { chat in
                        HStack{
                            Image(chat.avatar)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
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
                        .padding()
                        
                            }
                        }
                    }
                 .padding(.vertical, 8)
                 .navigationTitle("Чаты")
                 .listStyle(PlainListStyle())
                }
                
            }
        }


#Preview {
    ContentView()
}

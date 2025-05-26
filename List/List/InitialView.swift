//
//  InitialView.swift
//  List
//
//  Created by Olga Dragon on 26.05.2025.
//

import SwiftUI

struct InitialView: View{
    
    @Binding var isLoaded: Bool
    
    var body: some View{
        VStack {
            Spacer()
            Image(systemName: "message")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            Text("No chats here yet")
                .font(.title2)
                .padding(.top, 20)
            Button(action: {
                isLoaded = true
            }) {
                Text("Start chatting")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            Spacer()
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var isLoaded = false
        
        var body: some View {
            InitialView(isLoaded: $isLoaded)
        }
    }
    
    return PreviewWrapper()
}

//
//  Model.swift
//  List
//
//  Created by Olga Dragon on 23.05.2025.
//

import Foundation

struct Chat: Identifiable{
    let id = UUID()
    let name: String
    let message: String
    let time: String
    let avatar: String
    var isRead: Bool = false
    
    var isValid: Bool {
           !name.trimmingCharacters(in: .whitespaces).isEmpty &&
           !message.trimmingCharacters(in: .whitespaces).isEmpty &&
           !time.trimmingCharacters(in: .whitespaces).isEmpty
       }
    
 
}

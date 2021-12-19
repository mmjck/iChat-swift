//
//  iChatApp.swift
//  iChat
//
//  Created by Jackson Matheus dos Santos on 18/12/21.
//

import SwiftUI

import Firebase

@main
struct iChatApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}

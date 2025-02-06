//
//  LoginViewViewModel.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password
        )
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter both email and password."
            return false
        }
        
        guard email.contains( "@" ) && email.contains( "." ) else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters long."
            return false
        }
        
        return true
        
    }
}

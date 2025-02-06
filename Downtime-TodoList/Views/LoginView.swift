//
//  LoginView.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get Stuff Done", angle: 15, backgroundColor: Color.pink)
                
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TLButton(title: "Login", backgroundColor: .gray) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                // Create Account
                
                VStack {
                    Text("New Here?")
                    NavigationLink("Create Account", destination: RegisterView())
                }.padding(.bottom, 50)
            }
            
            Spacer()
        }
    }
}


#Preview {
    LoginView()
}

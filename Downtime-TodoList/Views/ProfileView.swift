//
//  ProfileView.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profiel(user: user)
                    
                } else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle(Text("Profile"))
        }
        .onAppear() {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profiel(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .clipShape(Circle())
            .padding()
        
        // User Info
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                    .padding()
                Spacer()
                Text(user.name)
                    .padding()
            }
            HStack {
                Text("Email:")
                    .bold()
                    .padding()
                Spacer()
                Text(user.email)
                    .padding()
            }
            HStack {
                Text("Member Since: ")
                    .bold()
                    .padding()
                Spacer()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .padding()
            }
        }
        
        //Sign out
        
        Button(action: {
            viewModel.logout()
        }, label: {
            Text("Sign Out")
        })
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}

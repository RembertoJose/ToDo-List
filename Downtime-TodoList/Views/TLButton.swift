//
//  TLButton.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Accion
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "title", backgroundColor: .blue) {
        // Action
    }
}

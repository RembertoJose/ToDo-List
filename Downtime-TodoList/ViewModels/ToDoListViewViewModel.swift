//
//  ToDoListViewViewModel.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingAddToDoItemView: Bool = false
    private let userId: String
    
    init(userID: String) {
        self.userId = userID
    }
    
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}

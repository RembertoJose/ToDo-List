//
//  ToDoListItemViewViewModel.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsComplete(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(try! itemCopy.asDictionary())
    }
}

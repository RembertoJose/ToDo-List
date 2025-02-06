//
//  ToDoListtView.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListtView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                // Delete
                                viewModel.deleteItem(id: item.id)
                            } label: {
                                Text("Delete")
                            }

                        }
                        .tint(.red)
                }
                .padding()
                .listStyle(PlainListStyle())
            }
            .navigationTitle(Text("To Do List"))
            .toolbar {
                Button {
                    // Action
                    viewModel.showingAddToDoItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingAddToDoItemView) {
                    NewItemView(newItemPresented: $viewModel.showingAddToDoItemView)
                }
            }
        }
    }
}

#Preview {
    ToDoListtView(userId: "RcNUw88NDCOuzwgBeispLnTTLuv2")
}

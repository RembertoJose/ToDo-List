//
//  User.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

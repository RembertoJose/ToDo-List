//
//  Extensions.swift
//  Downtime-TodoList
//
//  Created by Remberto Nunez on 1/28/25.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

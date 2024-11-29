//
//  ColorExtention.swift
//  ToDoListCoreDataSwiftUI
//
//  Created by Anna Panova on 29.11.24.
//

import Foundation
import SwiftUI


extension Color {
    
    static func colorFromTag(tag: String) -> Color {
        switch tag {
        case "red": return .red
        case "green": return .green
        case "blue" : return .blue
        default: return .black
        }
    }
}

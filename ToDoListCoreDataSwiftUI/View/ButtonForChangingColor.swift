//
//  ButtonForChangingColor.swift
//  ToDoListCoreDataSwiftUI
//
//  Created by Anna Panova on 09.12.24.
//

import SwiftUI

struct ButtonForChangingColor: View {
    let label: String =  "A"
    let buttonColor: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            
        } label: {
            Text(label)
        }
        .frame(width: 40, height: 30)
        .background(Color.gray.opacity(0.3))
        .foregroundColor(Color.colorFromTag(tag: buttonColor))
        .cornerRadius(10)

    }
}

struct ButtonForChangingColor_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForChangingColor(buttonColor: "black") {}
    }
}

//
//  AddView.swift
//  ToDoList
//
//  Created by Armaan Khan  on 26/08/24.
//

import SwiftUI

struct AddView: View {
    @Binding var items: [String]
    @State private var text = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
           
            Form {
                TextField("Add the item", text: $text)
                    
            }
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        items.append(text)
                        presentationMode.wrappedValue.dismiss()
                       // text = ""
                    }) {
                        Text("Done")
                    }
                }
            }
                
        }
        
    }
}

#Preview {
    AddView(items: .constant([]))
}

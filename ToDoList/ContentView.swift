//
//  ContentView.swift
//  ToDoList
//
//  Created by Armaan Khan  on 25/08/24.
//

import SwiftUI 

struct ContentView: View {
    @State private var isClicked = false
    @State private var isTemporary = false
    var body: some View {
        NavigationStack {
            Spacer()
            Button(action: {
                isClicked.toggle()
                isTemporary = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isTemporary = false
                }
            }) {
                Image( systemName: "plus.circle.fill")
                    .foregroundColor(isTemporary ? .blue :.gray)
                    .font(.system(size: 50))
                    .scaleEffect(isTemporary ? 1.2 : 1.0)
            }
            
        }
    }
}

#Preview {
    ContentView()
}

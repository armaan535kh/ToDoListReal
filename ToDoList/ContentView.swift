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
    @State private var showSheet = false
    @State private var items: [String] = []
    var body: some View {
        NavigationStack {
            List{
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .swipeActions{
                            Button(action: {
                                
                                items.remove(at: items.firstIndex(of: item)!)
                            }) {
                                Image(systemName: "trash")
                            }
                        }
                }
                
            }
            
            Spacer()
            Button(action: {
                isClicked.toggle()
                isTemporary = true
                showSheet = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isTemporary = false
                }
            })
            {
                Image( systemName: "plus.circle.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 50))
                    .scaleEffect(isTemporary ? 1.2 : 1.0)
            }
            .sheet(isPresented: $showSheet) {
                AddView(items: $items)
                   }
            
            .navigationTitle("To Do list")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
       
    }
}

#Preview {
    ContentView()
}

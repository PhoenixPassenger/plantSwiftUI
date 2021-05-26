//
//  SearchBar.swift
//  plantatinhas (iOS)
//
//  Created by Paulo Uchôa on 24/05/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .foregroundColor(.fontCreatePlant)
                .accentColor(.fontCreatePlant)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.topBackground)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.health)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.health)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 20)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    UIApplication.shared.endEditing()
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text("Cancel")
                        .foregroundColor(.fontCreatePlant)
                }
                .padding(.trailing, 20)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

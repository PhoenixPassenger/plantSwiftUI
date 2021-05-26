//
//  DashboardViewController.swift
//  plantatinhas (iOS)
//
//  Created by Cecilia Soares on 18/05/21.
//

import SwiftUI
import CoreData

struct DashboardViewController: View {
    @State var isLinkActive = false
    @State var showModal = false
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.topBackground
                .frame(height: 500)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    HStack {
                        Text("Cuidados de Hoje")
                            .foregroundColor(.fontCreatePlant)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(20)
                            .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
                        Button(action: {
                            showModal = true
                        }) {
                            Image("addIcon")
                                .padding(20)
                                .sheet(isPresented: $showModal, content: {
                                    NewPlantForm(showModal: $showModal)
                                })
                        }
                    }
                    HStack {
                        TodayCare()
                        TodayCare()
                    }
                    ZStack {
                        ViewBase()
                            .ignoresSafeArea()
                        MyPlantView()
                        
                    }}
            }
        }
    }

    
}
struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .foregroundColor(.fontCreatePlant)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.topBackground)
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }
                ) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
struct MyPlantView: View {
    var body: some View {
        
        VStack {
            
            Text("Minhas Plantas")
                //.bold()
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(20)
                .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
            
            SearchBar(text: .constant("Pesquisar"))
            Group{
                
                MyPlantsCell()
                MyPlantsCell()
                MyPlantsCell()
                MyPlantsCell()
                MyPlantsCell()
                MyPlantsCell()
                MyPlantsCell()
                MyPlantsCell()
            }.padding()
            
            
        }
    }
}
struct DashboardViewController_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewController()
            .previewDevice("iPhone 12")
    }
}

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
    @State var searchText: String = ""
    @State var allPlants: [PlantModel] = []
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.topBackground
                .frame(height: 500)
                .ignoresSafeArea()
            VStack {
                    HStack {
                        Text("Cuidados de Hoje")
                            .foregroundColor(.fontCreatePlant)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 20)
                            .padding(.top, 30)
                            .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)

                        Button(action: {
                            showModal = true
                        }) {
                            Image("addIcon")
                                .padding(.trailing, 20)
                                .padding(.top, 30)
                                .sheet(isPresented: $showModal, content: {
                                    NewPlantForm(showModal: $showModal)
                                })
                        }
                    }
                    HStack {
                        TodayCare()
                        
                    }
                    ZStack {
                        ViewBase()
                            .ignoresSafeArea()
                        MyPlantView(searchText: $searchText, allPlants: $allPlants)

                    }.padding(.top, 10)

            }
        }
    }
}

struct MyPlantView: View {
    @Binding var searchText: String
    @Binding var allPlants: [PlantModel]
    var body: some View {

        VStack {
            Text("Minhas Plantas")
                //.bold()
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading, 20)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
            SearchBar(text: $searchText)
                if !allPlants.isEmpty {
                    ScrollView {
                        ForEach(allPlants.filter({searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
    //                        NavigationLink(destination: ) {
                            
    //                        MyPlantsCell()
                                
    //                        }
                            }
                    }
                } else {
//                    Spacer()
//                    ZStack(alignment: .top) {
                        VStack(alignment: .center) {
                            Spacer()
                            Text("Adicione uma planta clicando em ")
                            .fontWeight(.regular)
                            .font(.system(size: 15))
                        
                            .foregroundColor(.health.opacity(1))
                            Image("addIconNoPlants")
//                            .padding(.bottom, UIScreen.main.bounds.height/3)
                        }.padding(.bottom, UIScreen.main.bounds.height/4)
                        .padding(.top, UIScreen.main.bounds.height/4)
                        .clipped()
//                    }
                }
            
        }
    }
}
struct DashboardViewController_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewController()
            .previewDevice("iPhone 12")
    }
}

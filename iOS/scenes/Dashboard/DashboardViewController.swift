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
    @State var allPlants: [Plant] = []
    
    var trailingButtom: some View {
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
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.topBackground
                    .frame(height: 500)
                    .ignoresSafeArea()
                VStack {
                        HStack {
                            TodayCare()
                        }.padding(.vertical, 20)
                    ZStack {
                        ViewBase()
                            .ignoresSafeArea()
                        
                        MyPlantView(searchText: $searchText, allPlants: $allPlants)
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {

                        Text("Cuidados de Hoje")
                            .foregroundColor(.health)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showModal = true
                    }) {
                        Image("addIcon")
                            .padding(.trailing, 20)
                            .padding(.top, 30)
                            .sheet(isPresented: $showModal, onDismiss: { allPlants = self.fechPlants() },content: {
                                NewPlantForm(showModal: $showModal)
                            })
                    }
                }
            }
            
        }.accentColor(.health)
        .onAppear(){
            allPlants = self.fechPlants()
        }
        
    }
    public func fechPlants() -> [Plant] {
        let plantWorker = PlantWorker()
        let plant = plantWorker.fetchPlants()
        //        ForEach (plant){ plant in
        //            let waterWorker = WaterWorker(plant)
        //
        //        }
        // ForEach(plant)
        return plant
    }
}

struct MyPlantView: View {
    @Binding var searchText: String
    @Binding var allPlants: [Plant]
    var body: some View {

        VStack {
            Text("Minhas Plantas")
                // .bold()
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading, 20)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
            SearchBar(text: $searchText)
                .padding(.bottom, 10)
                if !allPlants.isEmpty {
                    List {
                        ForEach(allPlants.filter({searchText.isEmpty ? true : $0.name!.contains(searchText) })) { item in
                            NavigationLink(destination: PlantDetails(plant: item) ) {
                                MyPlantsCell(plant: item)
                            }
//                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }.onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let plant = allPlants[index]
                                PlantWorker().delete(plant: plant)
                                allPlants =  PlantWorker().fetchPlants()
                            }
                        })
                    }
                } else {
                        VStack(alignment: .center) {
                            Spacer()
                            Text("Adicione uma planta clicando em ")
                            .fontWeight(.regular)
                            .font(.system(size: 15))
                            .foregroundColor(.fontCreatePlant.opacity(1))
                            Image("addIconNoPlants")
                                .accentColor(.fontCreatePlant)
                        }.padding(.bottom, UIScreen.main.bounds.height/4)
                        .padding(.top, UIScreen.main.bounds.height/4)
                        .clipped()

                }
        }
    }
}
struct DashboardViewController_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewController()
            .previewDevice("iPhone 8")
    }
}

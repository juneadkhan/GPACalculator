//
//  ContentView.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.presentationMode) var PresentationMode: Binding<PresentationMode>
    @EnvironmentObject var store: Semester // Stores the Class Data
    @State var showingSheet = false // Controls if the AddNewClassUIView Sheet is showing

    var body: some View {
            NavigationView {

                VStack {
                    List {
                        ForEach(store.catergories.keys.sorted().reversed(), id: \.self) { key in
                            // Creates Rows where classes are grouped by Semester
                            CategoryRow(key: key).environmentObject(self.store)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .onAppear { UITableView.appearance().separatorStyle = .none }
    
                    VStack {
                            Section {
                                Text("Current GPA is: ".uppercased())
                                    .font(.footnote)
                                Text(store.printGPA())
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                            }
                    }
                }
                .navigationBarTitle("GPA Calculator")
                .navigationBarItems(trailing:
                    Button(action: { self.showingSheet.toggle() }) {
                        Text("Add Class") }
                        .sheet(isPresented: $showingSheet) {
                                           AddNewClassUIView().environmentObject(self.store) })
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

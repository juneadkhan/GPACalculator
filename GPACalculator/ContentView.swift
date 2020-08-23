//
//  ContentView.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var store : Semester //Stores the Class Data
    @State var showingSheet = false //Controls if the add class sheet is showing.

    var body: some View {
        //This is the entire Stack container
        VStack {
           
            NavigationView {
                
                
                List {
                    
                    //This is the Section for the Add Class Button
                    Section {
                        Button(action: {}) {
                            Text("Add Class")
                        }
                    }
                    
                    //NEW SECTION
                    
                    Section {
                    /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Section Content@*/Text("Section Content")/*@END_MENU_TOKEN@*/
                    }
                    
                    
                }
                .navigationBarTitle(Text("GPA Calculator")) //Sets up the Title of the App
                .navigationBarItems(trailing: EditButton()) //Adds the EditButton to the App
                .listStyle(GroupedListStyle())
                //Makes the style of List, Grouped.
                    


            }
            
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

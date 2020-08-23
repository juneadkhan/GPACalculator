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
                    /* ADD CLASS BUTTON SECTION*/
                    //This is the Section for the Add Class Button
                    Section {
                        Button(action: {                                self.showingSheet.toggle() }) { //Toggles the showingSheet
                            Text("Add Class")
                        }
                        .sheet(isPresented: $showingSheet){
                                           AddNewClassUIView().environmentObject(self.store)
                                       
                    }
                    
                    /* CLASS LIST SECTION*/
                    //This is the section for the list of classes taken
                    Section {
                        ForEach(self.store.classStorage){
                           indv in
                            
                            VStack {
                                Text(indv.class_name!)
                                //Individual details per CLASS
                                    HStack {
                                        Text(indv.grade!)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(indv.outputGradeWorth())
                                            .font(.footnote)
                                                }
                                

                            }
                          
                            
                        }
                    
                }
                .navigationBarTitle(Text("GPA Calculator")) //Sets up the Title of the App
                .navigationBarItems(trailing: EditButton()) //Adds the EditButton to the App
                .listStyle(GroupedListStyle())
                //Makes the style of List, Grouped.

                }
            }//End of List
            
            } //End of Navigation View
            
            VStack {
                Section{
                    Text("Current GPA is: ")
                    Text(store.printGPA())
                }
            }
           
        } //End of VStack
    } //End of Body
} //End of ContentView


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

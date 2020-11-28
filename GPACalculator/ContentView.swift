//
//  ContentView.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI
import RealmSwift


struct ContentView: View {
    
    @EnvironmentObject var store : Semester //Stores the Class Data
    @State var showingSheet = false //Controls if the add class sheet is showing.
    
    let realm = try! Realm()

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
                    } //END OF SECTION
                    
                    /* CLASS LIST SECTION*/
                    //This is the section for the list of classes taken
                    Section {
                        ForEach(self.store.classStorage){
                           indv in
                            
                            VStack (alignment: .leading) {
                                
                                Text(indv.class_name!)
                                    .font(.headline)
                                //Individual details per CLASS
                                    HStack {
                                        
                                        Text(indv.grade!)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(indv.outputCreditHours())
                                            .font(.footnote)
                             
                                        
                                        // CODE TO ADD SEMESTER TO RIGHT HAND SIDE
                                        /*Spacer()
                                        
                                        Text("Fall 2020")
                                            .font(.caption) */

                                                } //END OF HSTACK

                            } //END OF VSTACK
                          
                            
                        } //END OF FOR EACH
                        .onDelete(perform: Delete)
                        .onMove(perform: Move)
                        //On Delete/On Move will go here
                    
                } //END OF SECTION
                } //END OF LIST
                .navigationBarTitle(Text("GPA Calculator")) //Sets up the Title of the App
                .navigationBarItems(trailing: EditButton()) //Adds the EditButton to the App
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)

                //Makes the style of List, Grouped.

 
            
            } //End of Navigation View
            
            VStack {
                Section{
                    Text("Current GPA is: ")
                    Text(store.printGPA())
                    .font(.headline)

                }
            } //End of VStack
           
        } //END OF VSSTACK
    } //End of Body
    
    func Move(from source: IndexSet, to destination: Int){
           store.classStorage.move(fromOffsets: source, toOffset: destination)
       }
       
       func Delete(offsets: IndexSet) {
           store.classStorage.remove(atOffsets: offsets)
            }

    
} //END OF CONTENT VIEW


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

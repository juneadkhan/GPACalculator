//
//  AddNewClassUIView.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import SwiftUI

/*
 This is a UI Element that pops over the Main UI to allow
 the user to Add a New Class
 
 INPUTS:
 - Class Name
 - Number of Credit Hours
 - Grade
 
 */
struct AddNewClassUIView: View {

    @Environment(\.presentationMode) var PresentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var store : Semester //Brings in Environment Object

    
    @State var value: String = "A" //DEFAULT
    @State var creditHours: Double = 3 //DEFAULT
    @State var className: String = "" //DEFAULT
    @State private var conditionsMet = false //DEFAULT


    var body: some View {


        VStack {
            VStack {
              
                NavigationView{

                    Form{
                     
                        Section{
                            
                            TextField("Class Name", text: $className)
                            
                        }

                        Section{
                            Picker(selection: $creditHours, label: Text("Number of Credit Hours")) {
                                Text("1").tag(1.0)
                                Text("1.5").tag(1.5)
                                Text("2").tag(2.0)
                                Text("3").tag(3.0)
                                Text("4").tag(4.0)
                                //Takes input number from Picker and tags it a corresponding value
                            }
                        }
                        
                        Section{
                            Picker(selection: $value, label: Text("Grade")) {
                                Group{
                                Text("A").tag("A")
                                Text("A-").tag("A-")
                                Text("B+").tag("B+")
                                Text("B").tag("B")
                                Text("B-").tag("B-")
                                Text("C+").tag("C+")
                                Text("C").tag("C")
                                Text("C-").tag("C-")
                                Text("D+").tag("D+")
                                Text("D").tag("D")
                                }
                                Group{
                                    
                                Text("F").tag("F")

                                }

                            }
                        }
                        Section{
                            Button(action: {
                                self.addClass()
                                self.PresentationMode.wrappedValue.dismiss()
                                
                            }) {

                                Text("Add New Class")
                            }
                                     
                                 }

                        

                    }
                    
                    .navigationBarTitle("Add New Class")
                    .listStyle(GroupedListStyle())
                    


                    
                
                }






            }

        }
        

     
}
    
    func addClass(){
        
        store.classStorage.append(Classes(class_name: className, grade: value, credit_hours: creditHours))


      }
    

struct AddNewClassUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewClassUIView()
    }
}
    
    
}



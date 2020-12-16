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
    @State var semesterName: String = "Fall 2020" //DEFAULT
    @State var categoryName: Classes.Category = Classes.Category.Spring2021 //DEFAULT
    @State var colourName: Double = 2 //DEFAULT

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
                                    
                                Text("PS").tag("PS")
                                Text("F").tag("F")


                                }

                            }
                        }
                        
                        
                        // Category Picker
                        Section{
                                 Picker(selection: $categoryName, label: Text("Semester")) {
                                     
                                    
                                    
                                    Group{
                                        Text("Fall 2017").tag(Classes.Category.Fall2017)
                                        Text("Spring 2018").tag(Classes.Category.Spring2018)
                                        Text("Summer 2018").tag(Classes.Category.Summer2018)
                                     }
                                    Group{
                                        Text("Fall 2018").tag(Classes.Category.Fall2018)
                                        Text("Spring 2019").tag(Classes.Category.Spring2019)
                                        Text("Summer 2019").tag(Classes.Category.Summer2019)
                                     }
     
                                    Group{
                                        Text("Fall 2019").tag(Classes.Category.Fall2019)
                                        Text("Spring 2020").tag(Classes.Category.Spring2020)
                                        Text("Summer 2020").tag(Classes.Category.Summer2020)
                                     }
                                    Group{
                                        Text("Fall 2020").tag(Classes.Category.Fall2020)
                                        Text("Spring 2021").tag(Classes.Category.Spring2021)
                                        Text("Summer 2021").tag(Classes.Category.Summer2021)
                                     }
                                    Group{
                                        Text("Fall 2021").tag(Classes.Category.Fall2021)
                                        Text("Spring 2022").tag(Classes.Category.Spring2022)
                                        Text("Summer 2022").tag(Classes.Category.Summer2022)
                                     }
                                    Group{
                                        Text("Fall 2022").tag(Classes.Category.Fall2022)
                                        Text("Spring 2023").tag(Classes.Category.Spring2023)
                                        Text("Summer 2023").tag(Classes.Category.Summer2023)
                                     }
                                    Group{
                                        Text("Fall 2023").tag(Classes.Category.Fall2023)
                                        Text("Spring 2024").tag(Classes.Category.Spring2024)
                                        Text("Summer 2024").tag(Classes.Category.Summer2024)
                                     }
                                    Group{
                                        Text("Fall 2024").tag(Classes.Category.Fall2024)
                                        Text("Spring 2025").tag(Classes.Category.Spring2025)
                                        Text("Summer 2025").tag(Classes.Category.Summer2025)
                                     }
                          
                                 }
                        }
                        
                        // Colour Picker
                                  Section{
                                           Picker(selection: $colourName, label: Text("Color")) {
                                               Group{
                                                Text("Purple").tag(1.0)
                                                Text("Blue").tag(2.0)
                                                Text("Green").tag(3.0)
                                                Text("Red").tag(4.0)
                                                Text("Yellow").tag(5.0)
                                                Text("Gray").tag(6.0)
                                                
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
                    .environment(\.horizontalSizeClass, .regular)

                    


                    
                
                }






            }

        }
        

     
}
    
    func addClass(){
        
        store.classStorage.append(Classes(class_name: className, grade: value, credit_hours: creditHours, category: categoryName, colour: colourName))


      }
    

struct AddNewClassUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewClassUIView()
    }
}
    
    
}



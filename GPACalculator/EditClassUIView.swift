//
//  EditClassUIView.swift
//  GPACalculator
//
//  Created by Junead Khan on 20/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import SwiftUI

struct EditClassUIView: View {

    @Environment(\.presentationMode) var PresentationMode: Binding<PresentationMode>
        
    var course: Classes
    @EnvironmentObject var store : Semester //Brings in Environment Object
    
    @State var value: String //DEFAULT
    @State var creditHours: Double //DEFAULT
    @State var className: String //DEFAULT
    @State var categoryName: Classes.Category//DEFAULT
    @State var colourName: Double //DEFAULT

    @State private var conditionsMet = false //DEFAULT
    
    init(course: Classes){
        
        self.course = course
        
        self._value = State<String>(initialValue: course.grade)
        
        self._creditHours = State<Double>(initialValue: course.credit_hours ?? 4)
        
        self._className = State<String>(initialValue: course.class_name)
        
        self._categoryName = State<Classes.Category>(initialValue: course.category)
        
        self._colourName = State<Double>(initialValue: course.colour ?? 2)
        /*
        self.categoryName = course.category
        self.creditHours = course.credit_hours ?? 3
        self.colourName = course.colour ?? 2
        self.value = course.grade
         */
    }


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
                                
                                let index = self.store.classStorage.firstIndex(where: { $0.id == self.course.id })!
                                
                                self.store.classStorage[index].editClass(class_name: self.className, grade: self.value, credit_hours: self.creditHours, category: self.categoryName, colour: self.colourName)
                                
                                self.store.classStorage = self.store.classStorage
                                
                                self.PresentationMode.wrappedValue.dismiss()
                                                                
                            }) {

                                Text("Edit Class")
                            }
                                     
                        }

                        

                    }
                    
                    .navigationBarTitle("Edit Class")
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)

                    


                    
                
                }






            }

        }
        
}

struct EditClassUIView_Previews: PreviewProvider {
    static var previews: some View {
        EditClassUIView(course: Classes(class_name: "COMP 401", grade: "A", credit_hours: 2.0, category: Classes.Category.Spring2021, colour: 3.0))
    }
}
    
    
}



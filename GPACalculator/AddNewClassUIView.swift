//
//  AddNewClassUIView.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import SwiftUI

struct AddNewClassUIView: View {

    @Environment(\.presentationMode) var PresentationMode: Binding<PresentationMode>
    @EnvironmentObject var store: Semester // Brings in Environment Object
    @State private var conditionsMet = false

    // Following State Variables intialised with pre-defined default values
    @State var value: String = "A"
    @State var creditHours: Double = 3
    @State var className: String = ""
    @State var colourName: Double = 2
    
    // CategoryName is based on the Semester the user's selection the previous time they added a class
    @State var categoryName: Course.Category = Course.Category(rawValue:
        UserDefaults.standard.integer(forKey: "Semester")) ?? Course.Category.spring2021

    var body: some View {
        VStack {
            VStack {
                NavigationView {

                    Form {
                        Section {
                            TextField("Class Name", text: $className)
                        }
                        // CreditHours Picker
                        Section {
                            Picker(selection: $creditHours, label: Text("Number of Credit Hours")) {
                                // Takes input number from Picker and tags it a corresponding value
                                Text("1").tag(1.0)
                                Text("1.5").tag(1.5)
                                Text("2").tag(2.0)
                                Text("3").tag(3.0)
                                Text("4").tag(4.0)
                                Text("5").tag(5.0)
                                }
                        }
                        // Grade Picker
                        Section {
                            Picker(selection: $value, label: Text("Grade")) {
                                Group {
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
                                Group {
                                Text("PS").tag("PS")
                                Text("F").tag("F")
                                }
                            }
                        }
                        // Category Picker
                        Section {
                                 Picker(selection: $categoryName, label: Text("Semester")) {
                                    Group {
                                        Text("Fall 2017").tag(Course.Category.fall2017)
                                        Text("Spring 2018").tag(Course.Category.spring2018)
                                        Text("Summer 2018").tag(Course.Category.summer2018)
                                     }
                                    Group {
                                        Text("Fall 2018").tag(Course.Category.fall2018)
                                        Text("Spring 2019").tag(Course.Category.spring2019)
                                        Text("Summer 2019").tag(Course.Category.summer2019)
                                     }

                                    Group {
                                        Text("Fall 2019").tag(Course.Category.fall2019)
                                        Text("Spring 2020").tag(Course.Category.spring2020)
                                        Text("Summer 2020").tag(Course.Category.summer2020)
                                     }
                                    Group {
                                        Text("Fall 2020").tag(Course.Category.fall2020)
                                        Text("Spring 2021").tag(Course.Category.spring2021)
                                        Text("Summer 2021").tag(Course.Category.summer2021)
                                     }
                                    Group {
                                        Text("Fall 2021").tag(Course.Category.fall2021)
                                        Text("Spring 2022").tag(Course.Category.spring2022)
                                        Text("Summer 2022").tag(Course.Category.summer2022)
                                     }
                                    Group {
                                        Text("Fall 2022").tag(Course.Category.fall2022)
                                        Text("Spring 2023").tag(Course.Category.spring2023)
                                        Text("Summer 2023").tag(Course.Category.summer2023)
                                     }
                                    Group {
                                        Text("Fall 2023").tag(Course.Category.fall2023)
                                        Text("Spring 2024").tag(Course.Category.spring2024)
                                        Text("Summer 2024").tag(Course.Category.summer2024)
                                     }
                                    Group {
                                        Text("Fall 2024").tag(Course.Category.fall2024)
                                        Text("Spring 2025").tag(Course.Category.spring2025)
                                        Text("Summer 2025").tag(Course.Category.summer2025)
                                     }
                                 }
                        }
                        // Colour Picker
                                  Section {
                                       Picker(selection: $colourName, label: Text("Color")) {
                                            Group {
                                                Text("Purple").tag(1.0)
                                                Text("Blue").tag(2.0)
                                                Text("Green").tag(3.0)
                                                Text("Red").tag(4.0)
                                                Text("Yellow").tag(5.0)
                                                Text("Gray").tag(6.0)
                                               }
                                       }
                                  }
                        Section {
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
    func addClass() {
        // Save Semester entered for future default setting
        UserDefaults.standard.set(self.categoryName.rawValue, forKey: "Semester")

        store.classStorage.append(Course(className: className, grade: value,
                        creditHours: creditHours, category: categoryName, colour: colourName))
      }

    struct AddNewClassUIView_Previews: PreviewProvider {
        static var previews: some View {
                AddNewClassUIView()
            }
        }
}

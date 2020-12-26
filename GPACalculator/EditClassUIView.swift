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
    @EnvironmentObject var store: Semester // Brings in Environment Object

    // Paramters will be intialised based on course
    @State var value: String
    @State var creditHours: Double
    @State var className: String
    @State var categoryName: Course.Category
    @State var colourName: Double
    @State private var conditionsMet = false
    var course: Course

    // Initialisation of Paramters
    init(course: Course){
        self.course = course
        self._value = State<String>(initialValue: course.grade)
        self._creditHours = State<Double>(initialValue: course.creditHours ?? 4)
        self._className = State<String>(initialValue: course.class_name)
        self._categoryName = State<Course.Category>(initialValue: course.category)
        self._colourName = State<Double>(initialValue: course.colour ?? 2)
    }
    
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
                                let index = self.store.classStorage.firstIndex(where: { $0.id == self.course.id })!
                                self.store.classStorage[index].editClass(className: self.className,
                                    grade: self.value, creditHours: self.creditHours,
                                    category: self.categoryName, colour: self.colourName)
                                self.store.classStorage = self.store.classStorage
                                self.store.objectWillChange.send()
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
            EditClassUIView(course: Course(className: "COMP 401", grade: "A",
                        creditHours: 2.0, category: Course.Category.spring2021, colour: 3.0))
        }
    }
}

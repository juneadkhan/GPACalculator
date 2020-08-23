//
//  Semester.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import Combine

//A Semester object is holds a series of Classes objects
class Semester : ObservableObject, Identifiable {

    @Published var classStorage : [Classes] { //Stores all the classses taken
        didSet { didChange.send() }

    }
    var SemesterGPA : Double; //Variable for the Overall GPA
    var didChange = PassthroughSubject<Void,Never>()

    
    init() {
        
        classStorage = []
        SemesterGPA = 0

       }
    
    //Adds new classs to classStorage array
    func addClass(newClass : Classes) {
        classStorage.append(newClass);
    }
    
    //Method for calculating GPA
    func calculateGPA() {
        SemesterGPA = 0;
        var creditHours = 0.0;
        var Score = 0.0;
        for Class in classStorage{
            creditHours += Class.credit_hours!
            Score += Class.grade_num!
        }
        SemesterGPA = Score/creditHours
    }

    //Method for outputing GPA vaariable as a String
    func printGPA() -> String {
        SemesterGPA = 0;
        var creditHours = 0.0;
        var Score = 0.0;
        for Class in classStorage{
            creditHours += Class.credit_hours!
            Score += Class.grade_num!
        }
        SemesterGPA = Score/creditHours

        //Formats the GPA to 3.d.p
        return String.localizedStringWithFormat("%.3f", SemesterGPA);
    }
    
}

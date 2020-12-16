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
        /*didSet { didChange.send() */
        
        didSet{ let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(classStorage){
                UserDefaults.standard.set(encoded, forKey: "classStorage")
        }
    }

    }
    var SemesterGPA : Double //Variable for the Overall GPA
    var didChange = PassthroughSubject<Void,Never>()
    
    var catergories: [Int: [Classes]] {
        Dictionary(grouping: classStorage, by: {$0.category.rawValue})
    }

    init(){
        self.SemesterGPA = 0.000

        if let items = UserDefaults.standard.data(forKey: "classStorage")
        {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode([Classes].self, from: items){
                self.classStorage = decoded
                return
            }
        }
        
        self.classStorage = []

    }
    
    
    /*
    init() {
        
        classStorage = []
        SemesterGPA = 0

       }
 
    */
    
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
            if (Class.grade_num == -1){
                continue;
            }
            creditHours += Class.credit_hours!
            Score += Class.grade_num! * Class.credit_hours!
        }
        SemesterGPA = Score/creditHours
    }

    //Method for outputing GPA vaariable as a String
    func printGPA() -> String {
        SemesterGPA = 0;
        var creditHours = 0.0;
        var Score = 0.0;
        for Class in classStorage{
            if (Class.grade_num == -1){
                  continue;
            }
            creditHours += Class.credit_hours!
            Score += Class.grade_num! * Class.credit_hours!
        }
        SemesterGPA = Score/creditHours

        //Formats the GPA to 3.d.p
        if (SemesterGPA.isNaN){
            return "0.000"
        }
        
        return String.localizedStringWithFormat("%.3f", SemesterGPA);
    }
    
    func removeClass(objectToRemove : Classes){
        
        if let index = classStorage.firstIndex(where: { $0 as AnyObject === objectToRemove as AnyObject}){
            classStorage.remove(at: index)
        }
    }
    
}

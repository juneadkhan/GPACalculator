//
//  Semester.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import Combine

// A Semester object has a field that holds an array of Course Objects and allows for GPA Calulations, Insertion and Removal

class Semester: ObservableObject, Identifiable {
    @Published var classStorage: [Course] { // Stores all the classses taken
        didSet { let encoder = JSONEncoder()
            if let encoded = try?
                encoder.encode(classStorage) {
                UserDefaults.standard.set(encoded, forKey: "classStorage")
                }
        }
    }
    var semesterGPA: Double // Variable for the Overall GPA
    var didChange = PassthroughSubject<Void, Never>()

    // Holds Classes in Dictionary grouped by the Semester they were taken in
    var catergories: [Int: [Course]] {
        return Dictionary(grouping: classStorage, by: {$0.category.rawValue})
    }

    init() {
        self.semesterGPA = 0.000

        if let items = UserDefaults.standard.data(forKey: "classStorage") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Course].self, from: items) {
                self.classStorage = decoded
                return
            }
        }
        self.classStorage = []

    }

    // Adds new classs to classStorage array
    func addClass(newClass: Course) {
        classStorage.append(newClass)
        self.updateView()
        self.didChange.send()
    }
    
    func getCatList(key: Int) -> [Course] {
        return catergories[key] ?? [Course(className: "")]
    }

    // Method for calculating GPA
    func calculateGPA() {
        semesterGPA = 0
        var creditHours = 0.0
        var sum = 0.0
        for course in classStorage {
            if course.gradeNum == -1 {
                continue
            }
            creditHours += course.creditHours!
            sum += course.gradeNum! * course.creditHours!
        }
        semesterGPA = sum/creditHours
    }

    // Method for outputing GPA vaariable as a String
    func printGPA() -> String {
        semesterGPA = 0
        var creditHours = 0.0
        var sum = 0.0
        for course in classStorage{
            if course.gradeNum == -1 {
                  continue
            }
            creditHours += course.creditHours!
            sum += course.gradeNum! * course.creditHours!
        }
        semesterGPA = sum/creditHours
        // Formats the GPA to 3.d.p
        if semesterGPA.isNaN {
            return "0.000"
        }
        return String.localizedStringWithFormat("%.3f", semesterGPA)
    }

    func removeClass(objectToRemove: Course) {
        if let index = classStorage.firstIndex(where: { $0 as AnyObject === objectToRemove as AnyObject}) {
            classStorage.remove(at: index)
        }
    }

    func updateView() {
        self.objectWillChange.send()
        self.didChange.send()
    }
}

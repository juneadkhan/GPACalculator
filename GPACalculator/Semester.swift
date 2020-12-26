//
//  Semester.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import Combine

// A Semester object is holds a series of Classes objects
class Semester: ObservableObject, Identifiable {
    @Published var classStorage: [Classes] { // Stores all the classses taken
        // KEEP AS DIDSET
        didSet { let encoder = JSONEncoder()
            if let encoded = try?
                encoder.encode(classStorage) {
                UserDefaults.standard.set(encoded, forKey: "classStorage")
                print("DEFO DEFO GOT HERE")

        }
    }

    }
    var semesterGPA: Double // Variable for the Overall GPA
    var didChange = PassthroughSubject<Void, Never>()
    var catergories: [Int: [Classes]] {
        print("UPDATED CATEGORIES")
        return Dictionary(grouping: classStorage, by: {$0.category.rawValue})
    }
    // Method
    func getCatList(key: Int) -> [Classes] {
        return catergories[key] ?? [Classes(class_name: "FAKE")]
    }

    init() {
        self.semesterGPA = 0.000

        if let items = UserDefaults.standard.data(forKey: "classStorage") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Classes].self, from: items) {
                self.classStorage = decoded
                print("GOT HERE")
                return
            }
        }
        self.classStorage = []

    }
    // Adds new classs to classStorage array
    func addClass(newClass: Classes) {
        classStorage.append(newClass)
        self.updateView()
        self.didChange.send()
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
    // Method Description
    func removeClass(objectToRemove: Classes) {
        if let index = classStorage.firstIndex(where: { $0 as AnyObject === objectToRemove as AnyObject}) {
            classStorage.remove(at: index)
        }
    }
    // Method Description
    func updateView() {
        self.objectWillChange.send()
        self.didChange.send()
    }
}

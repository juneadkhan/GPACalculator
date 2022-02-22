//
//  Classes.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import UIKit
import Foundation

// A Course object acts an individual class. e.g. "COMP 411"

public struct Course: Identifiable, Codable {

    public var id = UUID(); // Acts as a Unique ID
    public var class_name: String // Stores the Name of the Class
    public var grade: String // Stores the Grade Achieved e.g. "A"
    public var gradeNum: Double?
    public var creditHours: Double? // Stores the number of Credit Hours of the class
    var colour: Double? // Stores a represenatation of the Colour
    var category: Category // Allows for sorting by semester

    enum Category: Int, CaseIterable, Codable {
        
        case fall2018
        case spring2019
        case summer2019

        case fall2019
        case spring2020
        case summer2020

        case fall2020
        case spring2021
        case summer2021

        case fall2021
        case spring2022
        case summer2022

        case fall2022
        case spring2023
        case summer2023

        case fall2023
        case spring2024
        case summer2024

        case fall2024
        case spring2025
        case summer2025
        
        case fall2025
        case spring2026
        case summer2026
        
        case fall2026
        case spring2027
        case summer2027
    }

    init(className: String) {
        self.class_name = className
        self.grade = "PS"
        self.creditHours = 3.0
        self.category = Course.Category.fall2019
        self.colour = 4
        self.gradeNum = 1
        updateGradeWorth()
    }

    init(className: String, grade: String, creditHours: Double, category: Category, colour: Double) {
        self.class_name = className
        self.grade = grade
        self.creditHours = creditHours
        self.category = category
        self.colour = colour
        updateGradeWorth()
    }

    func outputGradeWorth() -> String {
        return gradeNum!.description
    }

    func outputCreditHours() -> String {
        return creditHours!.description
    }

    mutating func updateGrade(newGrade: String) {
        self.grade = newGrade;
        updateGradeWorth()
    }

    mutating func updateClassName(newName:String){
        self.class_name = newName;
    }

    mutating func updateGradeWorth(){
        switch grade {
        case "A":
            self.gradeNum = 4.0
        case "A-":
            self.gradeNum = 3.7
        case "B+":
            self.gradeNum = 3.3
        case "B":
            self.gradeNum = 3.0
        case "B-":
            self.gradeNum = 2.7
        case "C+":
            self.gradeNum = 2.3
        case "C":
            self.gradeNum = 2.0
        case "C-":
            self.gradeNum = 2.0
        case "D+":
            self.gradeNum = 1.7
        case "D":
            self.gradeNum = 1.0
        case "F":
            self.gradeNum = 0
        case "PS":
            self.gradeNum = -1
        case "IP":
            self.gradeNum = -1
        default:
            print("Some other character")

        }
    }

    func getPrimColour() -> UIColor {
        switch colour {
        case 1:
            return UIColor(#colorLiteral(red: 0.5254901961, green: 0.2392156863, blue: 1, alpha: 1))
        case 2:
            return UIColor(#colorLiteral(red: 0.168627451, green: 0.4431372549, blue: 1, alpha: 1))
        case 3:
            return UIColor(#colorLiteral(red: 0.2509803922, green: 0.4823529412, blue: 0.0431372549, alpha: 1))
        case 4:
            return UIColor(#colorLiteral(red: 0.4, green: 0.08235294118, blue: 0.1137254902, alpha: 1))
        case 5:
            return UIColor(#colorLiteral(red: 0.7254901961, green: 0.4784313725, blue: 0.09803921569, alpha: 1))
        case 6:
          return UIColor(#colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 1))
       default:
           print("Some other character")
            return UIColor(#colorLiteral(red: 0.5254901961, green: 0.2392156863, blue: 1, alpha: 1))
       }
    }

       func getSecColour() -> UIColor {
           switch colour {
           case 1:
               return UIColor(#colorLiteral(red: 0.6980392157, green: 0.6862745098, blue: 0.9647058824, alpha: 1))
           case 2:
               return UIColor(#colorLiteral(red: 0.5294117647, green: 0.6901960784, blue: 0.9882352941, alpha: 1))
           case 3:
               return UIColor(#colorLiteral(red: 0.7215686275, green: 0.8862745098, blue: 0.5921568627, alpha: 1))
           case 4:
               return UIColor(#colorLiteral(red: 0.9098039216, green: 0.4784313725, blue: 0.6431372549, alpha: 1))
           case 5:
               return UIColor(#colorLiteral(red: 0.968627451, green: 0.7803921569, blue: 0.3450980392, alpha: 1))
           case 6:
             return UIColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
           default:
              print("Some other character")
               return UIColor(#colorLiteral(red: 0.6980392157, green: 0.6862745098, blue: 0.9647058824, alpha: 1))
          }

       }

    func getSemesterName() -> String {
        switch category {
        case .fall2018 : return "Fall 2018"
        case .spring2019 : return "Spring 2019"
        case .summer2019 : return "Summer 2019"

        case .fall2019 : return "Fall 2019"
        case .spring2020 : return "Spring 2020"
        case .summer2020 : return "Summer 2020"

        case .fall2020 : return "Fall 2020"
        case .spring2021 : return "Spring 2021"
        case .summer2021 : return "Summer 2021"

        case .fall2021 : return "Fall 2021"
        case .spring2022 : return "Spring 2022"
        case .summer2022 : return "Summer 2022"

        case .fall2022 : return "Fall 2022"
        case .spring2023 : return "Spring 2023"
        case .summer2023 : return "Summer 2023"

        case .fall2023 : return "Fall 2023"
        case .spring2024 : return "Spring 2023"
        case .summer2024 : return "Summer 2024"

        case .fall2024 : return "Fall 2024"
        case .spring2025 : return "Spring 2025"
        case .summer2025 : return "Summer 2025"
            
        case .fall2025 : return "Fall 2025"
        case .spring2026 : return "Spring 2026"
        case .summer2026 : return "Summer 2026"
            
        case .fall2026 : return "Fall 2026"
        case .spring2027 : return "Spring 2027"
        case .summer2027 : return "Summer 2027"
        }
    }

    func getClassName() -> String {
        return class_name
    }

    mutating func editClass(className: String, grade: String, creditHours: Double, category: Category, colour: Double) {
        self.class_name = className
        self.grade = grade
        self.creditHours = creditHours
        self.category = Category.fall2019
        self.category = category
        self.colour = colour
        updateGradeWorth()
    }
}

extension Course: Comparable {
    public static func == (lhs: Course, rhs: Course) -> Bool {
        lhs.category.rawValue == rhs.category.rawValue
    }
    public static func < (lhs: Course, rhs: Course) -> Bool {
        lhs.category.rawValue < rhs.category.rawValue
    }
}

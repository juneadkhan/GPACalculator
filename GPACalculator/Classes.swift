//
//  Classes.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import UIKit
import Foundation

// Struct - Saves LONG TERM - Doesnt show up SHORT TERM
// Class - No save Long Term - DOES SHOW UP SHORT TERM
public struct Classes: Identifiable, Codable {
    // A Classes acts an individual class. e.g. "COMP 411"
    public var id = UUID(); //Acts as a Unique ID
    public var class_name: String //Stores the Name of the Class
    public var grade: String //Stores the Grade Achieved e.g. "A"
    public var gradeNum: Double?
    //public var grade_worth : Double?
    public var creditHours: Double? //Stores the number of Credit Hours of the class
    
    var colour: Double? //Stores a represenatation of the Colour
    
    var category: Category // Allows for sorting by semester
    
    enum Category: Int, CaseIterable, Codable{
       
        case Fall2017
        case Spring2018
        case Summer2018
        
        case Fall2018
        case Spring2019
        case Summer2019
        
        case Fall2019
        case Spring2020
        case Summer2020
        
        case Fall2020
        case Spring2021
        case Summer2021
        
        case Fall2021
        case Spring2022
        case Summer2022

        case Fall2022
        case Spring2023
        case Summer2023
        
        case Fall2023
        case Spring2024
        case Summer2024
        
        case Fall2024
        case Spring2025
        case Summer2025
    }
    
    init(class_name : String){
        self.class_name = class_name
        self.grade = ""
        self.creditHours = 2.0
        self.category = Classes.Category.Fall2017
        self.colour = 1
        self.gradeNum = 2
        UpdateGradeWorth()
    }
    
    init(class_name : String, grade : String, credit_hours : Double, category : Category, colour: Double){
        self.class_name = class_name
        self.grade = grade
        self.creditHours = credit_hours
        self.category = category
        self.colour = colour
        UpdateGradeWorth()
    }
    
    func outputGradeWorth() -> String {
        return gradeNum!.description
    }
    
    func outputCreditHours() -> String {
        return creditHours!.description
    }
    
    mutating func UpdateGrade(newGrade:String){
        self.grade = newGrade;
        UpdateGradeWorth()
    }
    
    mutating func UpdateClassName(newName:String){
        self.class_name = newName;
    }
    
    mutating func UpdateGradeWorth(){
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
        default:
            print("Some other character")

        }
    }
    
    func getPrimColour() -> UIColor{
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
    
       func getSecColour() -> UIColor{
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
    
    func getSemesterName() -> String{
        switch category {
        case .Fall2017 : return "Fall 2017"
        case .Spring2018 : return "Spring 2018"
        case .Summer2018 : return "Summer 2018"

        case .Fall2018 : return "Fall 2018"
        case .Spring2019 : return "Spring 2019"
        case .Summer2019 : return "Summer 2019"
            
        case .Fall2019 : return "Fall 2019"
        case .Spring2020 : return "Spring 2020"
        case .Summer2020 : return "Summer 2020"
            
        case .Fall2020 : return "Fall 2020"
        case .Spring2021 : return "Spring 2021"
        case .Summer2021 : return "Summer 2021"
            
        case .Fall2021 : return "Fall 2021"
        case .Spring2022 : return "Spring 2022"
        case .Summer2022 : return "Summer 2022"
     
        case .Fall2022 : return "Fall 2022"
        case .Spring2023 : return "Spring 2023"
        case .Summer2023 : return "Summer 2023"
            
        case .Fall2023 : return "Fall 2023"
        case .Spring2024 : return "Spring 2023"
        case .Summer2024 : return "Summer 2024"
            
        case .Fall2024 : return "Fall 2024"
        case .Spring2025 : return "Spring 2025"
        case .Summer2025 : return "Summer 2025"
        }
    }
    
    func getClassName() -> String{
        return class_name
    }

    mutating func editClass(class_name : String, grade : String, credit_hours : Double, category : Category, colour: Double){
        self.class_name = class_name
        self.grade = grade
        self.creditHours = credit_hours
        self.category = Category.Fall2019
        self.category = category
        self.colour = colour
        UpdateGradeWorth()
    }
}

extension Classes: Comparable {
    public static func == (lhs: Classes, rhs: Classes) -> Bool {
        lhs.category.rawValue == rhs.category.rawValue

    }
    public static func < (lhs: Classes, rhs: Classes) -> Bool {
        lhs.category.rawValue < rhs.category.rawValue
    }
}

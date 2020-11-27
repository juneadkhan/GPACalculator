//
//  Classes.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation

public class Classes : Identifiable {
    
    //A Classes acts an individual class. e.g. "COMP 411"
    
    public var id = UUID(); //Acts as a Unique ID
    public var class_name : String? //Stores the Name of the Class
    public var grade : String? //Stores the Grade Achieved e.g. "A"
    public var grade_num : Double?
    //public var grade_worth : Double?
    public var credit_hours : Double? //Stores the number of Credit Hours of the class
    
    init(class_name : String, grade : String, credit_hours : Double){
        self.class_name = class_name
        self.grade = grade
        self.credit_hours = credit_hours
        UpdateGradeWorth()
    }
    
    func outputGradeWorth() -> String {
        
        return grade_num!.description
    }
    
    func outputCreditHours() -> String {
        
        return credit_hours!.description
    }
    
    func UpdateGrade(newGrade:String){
        self.grade = newGrade;
        UpdateGradeWorth()
    }
    
    func UpdateClassName(newName:String){
        self.class_name = newName;
    }
    
    func UpdateGradeWorth(){
        
        switch grade{
        case "A":
            self.grade_num = 4.0;
        case "A-":
            self.grade_num = 3.7;
        case "B+":
            self.grade_num = 3.3;
        case "B":
            self.grade_num = 3.0;
        case "B-":
            self.grade_num = 2.7;
        case "C+":
            self.grade_num = 2.3;
        case "C-":
            self.grade_num = 2.0;
        case "D+":
            self.grade_num = 1.3;
        case "D":
            self.grade_num = 1.0;
        case "F":
            self.grade_num = 0;
        case "PS":
            self.grade_num = -1;
        default:
            print("Some other character")

        }
        
        
    }

    
}

//let testData = [
//    Classes(nameofClass: "COMP 401",classGrade: "B-", credit: 4),
//Classes(nameofClass: "HNUR 221",classGrade: "A", credit: 1),
//Classes(nameofClass: "ENGL 105",classGrade: "A-", credit: 3),
//Classes(nameofClass: "LFIT 130",classGrade: "A-", credit: 1),
//Classes(nameofClass: "POLI 150",classGrade: "A-", credit: 1),

//]

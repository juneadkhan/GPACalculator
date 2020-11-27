//
//  SemesterRealm.swift
//  GPACalculator
//
//  Created by Junead Khan on 03/10/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import RealmSwift

class SemesterRealm : Object {
    
    @objc dynamic var name: String?
    @objc dynamic var GPA: String?
    
    @objc dynamic var class_name = "" //Stores the Name of the Class
    @objc dynamic var grade = ""//Stores the Grade Achieved e.g. "A"
    @objc dynamic var grade_num = 0.0 //Stores value of grade
    //public var grade_worth : Double?
    @objc dynamic var credit_hours = 0.0 //Stores the number of Credit Hours of the class
    
    
}

class StorageRealm : Object {
    
    let classes = List<SemesterRealm>()
    
}


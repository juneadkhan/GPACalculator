//
//  Settings.swift
//  GPACalculator
//
//  Created by Junead Khan on 20/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Combine
import Foundation

//A Semester object is holds a series of Classes objects
class Settings: ObservableObject, Identifiable {

    @Published var stored : defaultSemester {
        /*didSet { didChange.send() */
        
        didSet{ let encoder = JSONEncoder()
            
            if let encoded = try?
                encoder.encode(stored){
                UserDefaults.standard.set(encoded, forKey: "defaultSemester")
        }
    }

    }

    init(){

        if let items = UserDefaults.standard.data(forKey: "defaultSemester")
        {
            let decoder = JSONDecoder()
            
            if let decoded = try?
                decoder.decode(defaultSemester.self, from: items){
                self.stored = decoded
                return
            }
        }
        
        self.stored = defaultSemester(name: "Spring 2021")
    }
    
}

struct defaultSemester: Identifiable, Codable {
    let id = UUID()
    var defName : String
    
    init(){
        self.defName = "Spring 2021"
    }
    
    init(name : String) {
        self.defName = name
    }
    
    mutating func changeSemester(newName: String) {
        self.defName = newName
    }
}

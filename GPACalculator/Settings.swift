//
//  Settings.swift
//  GPACalculator
//
//  Created by Junead Khan on 20/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Combine
import Foundation

/*
This object allows the AddNewClassUIView to set the initial picker value for Semester
based on the user's previous entry
 */

class Settings: ObservableObject, Identifiable {

    @Published var stored: DefaultSemester {
        didSet { let encoder = JSONEncoder()
            if let encoded = try?
                encoder.encode(stored) {
                UserDefaults.standard.set(encoded, forKey: "defaultSemester")
                }
            }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "defaultSemester") {
            let decoder = JSONDecoder()
            if let decoded = try?
                decoder.decode(DefaultSemester.self, from: items) {
                self.stored = decoded
                return
            }
        }
        self.stored = DefaultSemester(name: "Spring 2021")
    }
}

struct DefaultSemester: Identifiable, Codable {
    var id = UUID()
    var defName: String
    init() {
        self.defName = "Spring 2021"
    }
    init(name: String) {
        self.defName = name
    }
    mutating func changeSemester(newName: String) {
        self.defName = newName
    }
}

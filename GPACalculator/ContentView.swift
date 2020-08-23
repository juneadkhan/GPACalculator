//
//  ContentView.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/08/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //This is the entire Stack container
        VStack {
           
            NavigationView {
                
                
                List {
                    
                    //This is the Section for the Add Class Button
                    Section {
                        Button(action: {}) {
                            Text("Add Class")
                        }

                        
                        
                    }
                    
                    
                }
            }
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

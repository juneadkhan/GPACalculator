//
//  GPAView.swift
//  GPACalculator
//
//  Created by Junead Khan on 16/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct GPAView: View {
    var body: some View {
    {
        Section{
            Text("Current GPA is: ")
            Text(store.printGPA())
                .font(.headline)
            
        }
        
        }
    }
}


struct GPAView_Previews: PreviewProvider {
    static var previews: some View {
        GPAView()
    }
}

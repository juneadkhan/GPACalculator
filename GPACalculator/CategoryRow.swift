//
//  CategoryRow.swift
//  GPACalculator
//
//  Created by Junead Khan on 15/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI
import UIKit

struct CategoryRow: View {

    @State private var showingActionSheet = false
    @EnvironmentObject var store: Semester
    var key: Int // Refers to the Semester a class was taken in

    // Holds an array of Courses which all are of the same Semester
    var items: [Course] {
        return self.store.getCatList(key: self.key)
    }
    
    var gpa: String{
        return self.store.getCatGPA(key: self.key)
    }
    
    var credits: String{
        return self.store.getCatCredits(key: self.key)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
            Text(items[0].getSemesterName().uppercased())
                .font(.footnote)
                .padding(.leading, 5)
                .padding(.top, 2)
                
                Spacer()
                
                Text("" + credits + " Credits" + " - GPA: " + gpa)
                    .font(.footnote)
                    .padding(.trailing, 5)
                    .padding(.top, 2)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    if !self.items.isEmpty {
                        ForEach(items) { course in
                            VStack {
                                // Pass Individual Course to CategoryItem view to display its details in a Card
                                CategoryItem(courseInput: course).environmentObject(self.store)
                            }
                        }
                    }
                }
            }.frame(height: 105)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var classes = Semester().classStorage
    static var previews: some View {
        CategoryRow(key: 2)
            .environmentObject(Semester())
    }
    
}

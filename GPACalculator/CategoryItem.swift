//
//  CategoryItem.swift
//  GPACalculator
//
//  Created by Junead Khan on 15/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {

    @EnvironmentObject var store: Semester
    @State private var showingEditSheet = false
    @State private var showingActionSheet = false
    var courseInput: Course
    var index: Int { store.classStorage.firstIndex(where: { $0.id == courseInput.id }) ?? 0 }

    // Gets the course from the EnviromentObject Store to ensure it is always up-to-date
    var course: Course {
        if !store.classStorage.isEmpty {
            return store.classStorage[index]
        } else {
            return Course(className: "")
        }
    }

    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(
                    colors: [Color(course.getPrimColour()),
                    Color(course.getSecColour())]),
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing)
                VStack {
                    HStack {
                        Text(course.grade)
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                      Spacer()
                    }
                    HStack {
                        Text(course.class_name)
                            .font(.system(size: 14.5, weight: .semibold, design: .rounded))
                              .foregroundColor(.white)
                              .padding(.leading, 10)
                        Spacer()
                      }
                    HStack {
                        Text(course.outputCreditHours() + " Credits")
                            .font(.system(size: 11, weight: .regular, design: .rounded))
                              .foregroundColor(.white)
                              .padding(.leading, 10)
                        Spacer()
                      }
                }
            }
        .frame(width: 120, height: 100)
        .cornerRadius(15)
        .onTapGesture {
                self.showingActionSheet = true
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Choose Option"), buttons: [
                    // Edit Button
                    .default(Text("Edit"), action: {
                    self.showingEditSheet.toggle()}),

                    // Delete Button
                    .destructive(Text("Delete"), action: {
                    self.delete(at: self.store.classStorage.firstIndex(where: { $0.id == self.course.id })!)}),

                    // Cancel Button
                    .cancel()
                ])
            } .sheet(isPresented: $showingEditSheet) {
                EditClassUIView(course: self.course).environmentObject(self.store)
            }
    }

    func delete(at index: Int) {
        store.classStorage.remove(at: index)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(courseInput: Course(className: "COMP 401", grade: "A",
                    creditHours: 2.0, category: Course.Category.spring2021, colour: 3.0))
            .environmentObject(Semester())
    }
}

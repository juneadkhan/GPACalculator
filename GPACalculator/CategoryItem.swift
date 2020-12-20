//
//  CategoryItem.swift
//  GPACalculator
//
//  Created by Junead Khan on 15/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    
    var course: Classes
    @State private var showingActionSheet = false
    @EnvironmentObject var store : Semester //Stores the Class Data
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(course.getPrimColour()), Color(course.getSecColour())]), startPoint: .bottomLeading, endPoint: .topTrailing)
            
            VStack {
                HStack{
                    Text(course.grade)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                  Spacer()
                    
                }
                
                HStack{
                    Text(course.class_name)
                          .font(.system(size: 16, weight: .semibold, design: .rounded))
                          .foregroundColor(.white)
                          .padding(.leading, 10)
                    Spacer()
                    
                  }
                
                HStack{
                    Text(course.outputCreditHours() + " Credits")
                        .font(.system(size: 10, weight: .regular, design: .rounded))
                          .foregroundColor(.white)
                          .padding(.leading, 10)
                    Spacer()
                    
                      
                  }
            }
        }
    .frame(width: 120, height: 100)
    .cornerRadius(15)
        .onLongPressGesture{
            self.showingActionSheet = true;
             }.actionSheet(isPresented: self.$showingActionSheet){
                ActionSheet(title: Text("Choose Action"), buttons: [
                 
                     ActionSheet.Button.destructive(Text("Delete Class"), action: {
                         
                         print("INDV ID")
                        print(self.course.id)
                        print(self.course.class_name)
                         
                         print("CLASS IDS")
                         for i in self.store.classStorage{
                             
                             print(i.id, " --  ", i.class_name)
                             
                         }
                         
                         
                        self.Delete(at: self.store.classStorage.firstIndex(where: { $0.id == self.course.id })!) }
                         
                         ),
                     ActionSheet.Button.cancel()
                     
                 
                 ])
                 }

     
    }
    
    
    func Delete(at index: Int) {
        store.classStorage.remove(at: index)
    }
    
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(course: Classes(class_name: "COMP 401", grade: "A", credit_hours: 2.0, category: Classes.Category.Spring2021, colour: 3.0))
    }
}

//
//  CategoryItemSingle.swift
//  GPACalculator
//
//  Created by Junead Khan on 23/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct CategoryItemSingle: View {
    
    @State private var showingEditSheet = false
    @State private var showingActionSheet = false
    @EnvironmentObject var store : Semester //Stores the Class Data
    var index = 0
    
    var body: some View {
    
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(self.store.classStorage[0].getPrimColour()), Color(self.store.classStorage[0].getSecColour())]), startPoint: .bottomLeading, endPoint: .topTrailing)
                
                VStack {
                    HStack{
                        
                        Text(self.store.classStorage[0].grade)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        
                   
                      Spacer()
                        
                    }
                    
                    HStack{
                        Text(store.classStorage[0].class_name)
                              .font(.system(size: 16, weight: .semibold, design: .rounded))
                              .foregroundColor(.white)
                              .padding(.leading, 10)
                        Spacer()
                        
                      }
                    
                    HStack{
                        Text(store.classStorage[0].outputCreditHours() + " Credits")
                            .font(.system(size: 10, weight: .regular, design: .rounded))
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
                print("EDIT MENU ACTIVATED")
             
                
            }
            .actionSheet(isPresented: $showingActionSheet){
                ActionSheet(title: Text("Choose Option"), buttons: [
                
                    .default(Text("Edit"), action: {
                         
                        
        
                        self.showingEditSheet.toggle()
                        
                    }),
                    
                    .destructive(Text("Delete"), action: {
                        
                        print("DELETE BUTTON CLICKED")
                        for i in self.store.classStorage{
                           
                            print(i.class_name)
                                    
                        }
                                
                    
                        
                         self.Delete(at: 0)
                        
                    }),
                    
                    .cancel()
                
                
                ])
            } .sheet(isPresented: $showingEditSheet){
                EditClassUIView(course: self.store.classStorage[0]).environmentObject(self.store)
            }
        
    }
    
    
    func Delete(at index: Int) {
        store.classStorage.remove(at: index)
    }
    
}

struct CategoryItemSingle_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(course: Classes(class_name: "COMP 401", grade: "A", credit_hours: 2.0, category: Classes.Category.Spring2021, colour: 3.0))
    }
}

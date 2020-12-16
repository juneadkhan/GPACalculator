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
    .padding(.leading, 5)

        /*
        VStack {
                /*
                   Image("swiftui-button")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
        */
                   
        
            HStack {
                       VStack(alignment: .leading) {
                      
                           Text("COMP 401")
                               .font(.title)
                               .fontWeight(.black)
                               .foregroundColor(.primary)
                               .lineLimit(3)
                        HStack{
                            Text("B-")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Text("4.0")
                                                .font(.headline)
                                                .foregroundColor(.secondary)
                            
                        }
       
                       }
                       .layoutPriority(100)
        
                       Spacer()
                   }
                   .padding()
               }
               .cornerRadius(10)
               .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
               )
               .padding([.top, .horizontal])
           }
        
        
        /*
        VStack(alignment: .leading){
            Text(course.class_name)
                .font(.caption)
        }
        .padding(.leading, 15)
         */
 
 */
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(course: Classes(class_name: "COMP 401", grade: "A", credit_hours: 2.0, category: Classes.Category.Spring2021, colour: 3.0))
    }
}

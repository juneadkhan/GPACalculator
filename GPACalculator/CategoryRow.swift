//
//  CategoryRow.swift
//  GPACalculator
//
//  Created by Junead Khan on 15/12/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    @EnvironmentObject var store : Semester //Stores the Class Data
    var items: [Classes]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(items[0].getSemesterName().uppercased())
                .font(.footnote)
                .padding(.leading, 5)
                .padding(.top, 2)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top, spacing: 5){
                    
                    ForEach(items) { indv in
                        
                        HStack{
                        
                        CategoryItem(course: indv)
                        
                        }
                        .contextMenu{
                            Button(action: {
                                //guard let index = self.items.firstIndex(of: indv) else { return }
                                self.Delete(at: self.store.classStorage.firstIndex(where: { $0.id == indv.id })!)})
                            {
                                Text("Delete")
                                    .foregroundColor(Color.red)
                                Image(systemName: "trash.fill")
                                    .foregroundColor(Color.red)
                                }
                        }
                        
                    }
                }
             
      
            }
            .frame(height:105)
        }
    }
    
    func Delete(at index: Int) {
        store.classStorage.remove(at: index)
    }

}



struct CategoryRow_Previews: PreviewProvider {
    
    static var classes = Semester().classStorage
    
    static var previews: some View {
        CategoryRow(items: Array(arrayLiteral: Classes(class_name: "COMP 401", grade: "A", credit_hours: 2.0, category: Classes.Category.Spring2021, colour: 3.0)))
    }
}

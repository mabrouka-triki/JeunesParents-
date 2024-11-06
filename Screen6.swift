//
//  Screen6.swift
//  JeunesParents
//
//  Created by Apprenant174 on 31/10/2024.
//

import SwiftUI

struct Screen6: View {
    
    @EnvironmentObject var taskData: TaskData
    @State private var date = Date()
    
    func numberOfTask (user : User) -> Int {
        
        var taskname = 0
        for task in taskData.tasks {
            if task.user.id == user.id {
                taskname += 1
            }
        }
        return taskname
    }
    
    
    
    var body: some View {
      
        NavigationStack{
            
            ScrollView{
            
                VStack{
                    
                    
                    Spacer()
                    
                    DatePicker("Date/Heure", selection: $date)
                        .padding()
                        .frame(width: 350, height: 350.0)
                        .datePickerStyle(.graphical)
                    
                    
                    
                    VStack {
                        
                        
                        ForEach(users) { user in
                            
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 370.0, height: 60.0)
                                    .foregroundColor(.colorGrayWhite)
                                
                                HStack {
                                    
                                    Image(user.image)
                                        .resizable()
                                        .frame(width: 66, height: 60)
                                        .scaledToFit()
                                        .padding(.leading)
                                        .cornerRadius(10)
                                    
                                    
                                    
                                    ForEach(taskData.tasks.sorted(by: {
                                        task0, task1 in
                                        task0.date > task1.date
                                    })) { task in
                                        if user.id == task.user.id {
                                            Text(task.taskname)
                                                .fontWeight(.black)
                                                .padding()
                                                .frame(maxWidth:.infinity,alignment: .bottom)
                                                .foregroundColor(.colorBlue)
                                        }
                                    }
                                    if numberOfTask(user: user) == 0 {
                                        Text("Rien à faire")
                                            .fontWeight(.black)
                                            .padding()
                                            .frame(maxWidth:.infinity,alignment: .bottom)
                                            .foregroundColor(.colorBlue)
                                    }
                                }
                            }
                        }
                    }
                }
                
            }.navigationTitle("AGENDA")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Screen6()
        .environmentObject(TaskData())
}

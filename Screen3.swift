//
//  Screen3.swift
//  JeunesParents
//
//  Created by Apprenant174 on 29/10/2024.
//

import SwiftUI

struct Screen3: View {
    
    @EnvironmentObject var taskData: TaskData
    
    @State var familyName = ""
    @State private var showscreenadd = false
    
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
        
        VStack{
//            Text("\(users[0].familyName) 👋")
//                .bold()
//                .font(.title)
//                .frame(maxWidth:.infinity,alignment: .center)
//                .foregroundColor(.colorBlue)
            
            
//            Spacer()
            
//            HStack {
                
//                ForEach(users) { user in
//                    VStack {
//                        Image(user.image)
//                            .resizable()
//                            .scaledToFit()
//                            .padding()
//                            .frame(height: 90)
//                        
//                        Text(user.name)
//                            .foregroundColor(.colorBlue)
//                            .bold()
//                            .font(.title3)
//                        
//                    }
//                }
//            }
            
            NavigationLink(destination: Screen2()) {
                Image(systemName: "person.crop.circle.badge.plus")
                    .foregroundColor(.orange)
                
                Text("Ajouter un membre")
                    .foregroundColor(.orange)
                    .padding()
                    .cornerRadius(15)
            }
            
//            Spacer()
            
            
            Text("Tâches :")
                .bold()
                .font(.title)
            
            
            
            VStack {
                
                
                ForEach(users) { user in
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.colorGrayWhite)
                        HStack {
                            VStack(alignment: .center) {
                                Image(user.image)
                                    .resizable()
                                    .frame(width: 66, height: 60)
                                    .scaledToFit()
//                                    .padding(.leading)
                                    .cornerRadius(10)
                                Text(user.name)
                                    .foregroundColor(.colorBlue)
                                    .fontWeight(.semibold)
//                                    .font(.title3)
                                    .frame(width: 80)
                            }
                            
                            
                            
                            Spacer()
                            
                            
                            ForEach(taskData.tasks.sorted(by: {
                                task0, task1 in
                                task0.date > task1.date

                            })) { task in
                                NavigationLink(destination: Screen7(tachedata: task, dismissModal: .constant(false))) {
                                    if user.id == task.user.id {
                                        Text(task.taskname)
                                            .fontWeight(.bold)
//                                            .padding()
                                            .frame(maxWidth:.infinity,alignment: .bottom)
                                            .foregroundColor(.colorBlue)
                                          
                                    }
                                }
                              
                            }
                            
                            
                            
                            
                            
                            
                            if numberOfTask(user: user) == 0 {
                                Text("Rien à faire")
                                    .fontWeight(.black)
//                                    .padding()
                                    .frame(maxWidth:.infinity,alignment: .bottom)
                                    .foregroundColor(.colorBlue)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }.padding()
          
                        
//                        Spacer()
                        
            Button(action: {
                showscreenadd.toggle()
            }, label: {
                Image(systemName: "note.text.badge.plus")
                    .foregroundColor(.orange)
                
                Text("Ajouter une tâche")
                    .foregroundColor(.orange)
                    .padding()
                    .cornerRadius(15)
            })
            .sheet(isPresented: $showscreenadd, content: {
                Screen5(dismissModal: $showscreenadd)
            })

        
            }   .navigationBarBackButtonHidden()
                .navigationTitle("BIENVENUE FAMILLE \(users[0].familyName) 👋")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct Screen3_Previews: PreviewProvider {
    static var previews: some View {
        Screen3()
            .environmentObject(TaskData())
    }
}

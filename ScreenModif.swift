//
//  ScreenModif.swift
//  JeunesParents
//
//  Created by Apprenant174 on 04/11/2024.
//

import SwiftUI

struct ScreenModif: View {
    
   // @State private var user = user[""]
    @State private var text = ""
    @State private var name =  users[0].name
    @State private var date = Date()
    @State private var selectedrecurrence = Recurrence.daily
    @State private var selectedPriority: Priorities = .exclamationmark
    
    
    
    
//    @State private var tasks: [Tache] = []
    
    @Binding var dismissModal: Bool
    @Binding var tacheData: Tache
    @EnvironmentObject var taskData: TaskData

 
    
    func changeColor() -> Color {
        if selectedPriority == .exclamationmark  {
            return Color.green
        } else if selectedPriority == .exclamationmark2 {
            return Color.yellow
        } else if selectedPriority == .exclamationmark3 {
            return Color.red
        }
        return .black
    }
    
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                ZStack{
                    
                    VStack(spacing: 11.0){
                        
                        
                        TextField("Modifier la tâche ...", text: $text)
                            .padding()
                            .frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black)
                                    .frame(width: 350, height: 50)
                            )
                            .onAppear {
                                text = tacheData.taskname
                                name = tacheData.user.name
                                date = tacheData.date
                                selectedrecurrence = tacheData.recurrence
                                selectedPriority = tacheData.priority
                                
                                
                            }
                        
                        Spacer()
                        
                        VStack {
                            Text("Qui effectue la tâche ?")
                                .fontWeight(.bold)
                                .foregroundColor(Color("ColorBlue"))
                            
                            Picker("Qui", selection: $name) {
                                ForEach(users, id: \.self) { user in
                                    Text(user.name).tag(user.name)
                                }
                            }
                            .tint(.orange)
                        }
                        
                        Spacer()
                        
                        
                        Text("Quand ?")
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorBlue"))
                        DatePicker("Date/Heure", selection: $date)
                            .padding()
                            .frame(width: 350, height: 50.0)
                            .datePickerStyle(.compact)
                        
                        
                        Spacer()
                        
                        Text("Récurrence")
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorBlue"))
                        
                        Picker("récurrence", selection: $selectedrecurrence) {
                            ForEach(Recurrence.allCases, id: \.self) { recurrence in
                                Text(recurrence.rawValue).tag(Recurrence.allCases)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(.orange)
                        Spacer()
                        Text("Prioriété")
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorBlue"))
                        
                        Picker("Priorities", selection: $selectedPriority) {
                            Image(systemName: Priorities.exclamationmark.rawValue).tag(Priorities.exclamationmark)
                            Image(systemName: Priorities.exclamationmark2.rawValue).tag(Priorities.exclamationmark2)
                            Image(systemName: Priorities.exclamationmark3.rawValue).tag(Priorities.exclamationmark3)
                        }
                        .frame(width: 109.0, height: 50.0)
                        .pickerStyle(.segmented)
                        .colorMultiply(changeColor())
                        
                
                        Spacer()
                        
                        VStack{
                            
                            //                            NavigationLink(destination: Screen3()) {
                            Button(action: {
                                dismissModal.toggle()
                               tacheData.taskname = text
                                tacheData.user.name = name
                                tacheData.date = date
                                tacheData.recurrence = selectedrecurrence
                                tacheData.priority = selectedPriority
                                
                                
                            }, label: {
                                Text("VALIDER")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.orange)
                                    .cornerRadius(15)
                                    .bold()
                            })
                            
                            
                            //                            }
                        }
                    }
                }
            } .navigationTitle("Modifier la tâche")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(Color("ColorBlue"))
                .padding()
        }
         
    }
}

struct ScreenModif_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScreenModif(dismissModal: .constant(false), tacheData: .constant(Tache(taskname: "Aspirateur", user: users[0], date: Date(), recurrence: .weekly, image: "robotic.vacuum.fill", priority: .exclamationmark)))
                .environmentObject(TaskData())
        }
    }
}

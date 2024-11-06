//
//  Screen5.swift
//  JeunesParents
//
//  Created by apprenant121 on 29/10/2024.
//

import SwiftUI

struct Screen5: View {
    @EnvironmentObject var taskData: TaskData
    
    @State private var text = ""
    @State private var name =  users[0].name
    @State private var date = Date()
    @State private var selectedrecurrence = Recurrence.daily
    @State private var selectedPriority: Priorities = .exclamationmark
    
    @Binding var dismissModal: Bool

    
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
                        
                        
                        TextField("Nouvelle tâche ...", text: $text)
                            .padding()
                            .frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black)
                                    .frame(width: 350, height: 50)
                            )
                        
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
                            Image(systemName: "exclamationmark").tag(Priorities.exclamationmark)
                                .colorMultiply(Priorities.exclamationmark.priority)
                            Image(systemName:"exclamationmark.2").tag(Priorities.exclamationmark2)
                            Image(systemName:"exclamationmark.3").tag(Priorities.exclamationmark3)
                        }
                        .frame(width: 109.0, height: 50.0)
                        .pickerStyle(.segmented)
                        .colorMultiply(changeColor())
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.colorGrayWhite)
                                .frame(width: 370, height: 100)
                                .cornerRadius(15)
                            HStack{
                                
                                Text("""
\(text) \r\(name) \r\(date.formatted()) \r\(selectedrecurrence)
""")
                                .italic()
                                
                            }
                        }
                        Spacer()
                        
                        VStack{
                            
                            Button(action: {
                                var selectedUser: User = User(image: "", familyName: "", name: "", role: .enfant)
                                for user in users {
                                    if name == user.name {
                                      selectedUser = user
                                    }
                                }
                             
                                taskData.tasks.append(Tache(taskname: text, user: selectedUser , date: date, recurrence: selectedrecurrence , image: "", priority: selectedPriority))
                                dismissModal.toggle()
                                
                            }, label: {
                                Text("VALIDER")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.orange)
                                    .cornerRadius(15)
                                    .bold()
                            })
                        }
                    }
                }
            } .navigationTitle("Nouvelle tâche")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(Color("ColorBlue"))
                .padding()
        }
    }
}

#Preview {
    Screen5(dismissModal: .constant(false))
        .environmentObject(TaskData())
}

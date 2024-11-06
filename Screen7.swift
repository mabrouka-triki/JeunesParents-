//
//  Screen7.swift
//  JeunesParents
//
//  Created by Apprenant174 on 04/11/2024.
//

import SwiftUI

struct Screen7: View {
    
    @State var tachedata: Tache
    @EnvironmentObject var taskData: TaskData
    
    @State private var text = ""
    @State private var name =  users[0].name
    @State private var date = Date()
    //@State private var recurrence = ["Jamais","Tous les jours", "Tous les mois", "Toutes les semaines", "Tous les ans"]
    @State private var selectedrecurrence = Recurrence.daily
    @State private var selectedPriority: Priorities = .exclamationmark
    
    @Binding var dismissModal: Bool

    
    @State private var showscreenmodif = false
    
    //    @State private var tasks: [Tache] = []
    
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
        
        
        //        NavigationStack{
        
        
        ScrollView{
            
            ZStack{
                
                VStack(spacing: 11.0){
                    
                    
                    Text(tachedata.taskname)
                        .padding()
                    
                    
                    Spacer()
                    
                    VStack {
                        Text(tachedata.user.name)
                            .fontWeight(.bold)
                            .foregroundColor(Color("ColorBlue"))
                    }
                    
                    Spacer()
                    
                    
                    Text(tachedata.date.formatted())
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorBlue"))
                    
                    
                    
                    Spacer()
                    
                    Text(tachedata.recurrence.rawValue)
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorBlue"))
                    
                    Spacer()
                    
                    
                    
                    Image(systemName: tachedata.priority.rawValue)
                        .padding()
                        .background(tachedata.priority.priority)
                    
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
                    
                    showscreenmodif.toggle()
                }, label: {
                    Text("MODIFIER")
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(15)
                        .bold()
                })
                .sheet(isPresented: $showscreenmodif){
                    ScreenModif(dismissModal: $showscreenmodif, tacheData: $tachedata)
                }
            }
        }
        
        
        //        }
        
        
        .navigationTitle("RECAPITULATIF")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(Color("ColorBlue"))
        .padding()
    }
    
}



struct Screen7_Previews: PreviewProvider {
    static var previews: some View {
        Screen7(tachedata: Tache(taskname: "Aspirateur", user: users[0], date: Date(), recurrence: .weekly, image: "robotic.vacuum.fill", priority: .exclamationmark), dismissModal: .constant(false))
            .environmentObject(TaskData())
    }
}

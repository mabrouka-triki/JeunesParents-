//
//  Screen4.swift
//  JeunesParents
//
//  Created by Apprenant120 on 29/10/2024.
//

import SwiftUI
struct Screen4: View {
    @EnvironmentObject var taskData: TaskData
    var body: some View {
        
        //la navigationSTACK ENGLOB TOUT
        
        NavigationStack{
            
            VStack() {
                
                if let Mabrouka = users.first(where: { $0.name == "Maryama" }) {
                    
                    VStack {
                        
                        Image(Mabrouka.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(10)
                        
                        
                    }
                        
                        //  my name and my role
                        
                        VStack() {
                            
                          
                            Text("\(Mabrouka.name)")
                                .font(.title)
                            Text("\(Mabrouka.familyName)")
                                .font(.headline)
                                .foregroundColor(.colorBlue)
                            Text(Mabrouka.role == .parent ? "Parent" :
                                    Mabrouka.role == .enfant ? "Enfant" :
                                    "Grandparent")
                            
                            
                            .foregroundColor(.black)
                        }
                        .padding()
                        
                        // tasks of me
                        
                    
                    VStack(alignment: .leading) {
                        Text("Mes tâches :")
                            .font(.headline)
                            .foregroundColor(Color("ColorBlue"))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center) //centre

                        ForEach(taskData.tasks.filter { $0.user.id == Mabrouka.id }) { task in
                            ZStack(alignment: .leading) {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.colorGrayWhite)
                                    .frame(height: 80)
                                
                                HStack {
                                    Image(Mabrouka.image)
                                        .resizable()
                                        .frame(width: 66, height: 66)
                                        .cornerRadius(10)
                                        .padding(.leading)

                                    Text(task.taskname)
                                        .padding(.leading, 10)
                                        .font(.body)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding()
                        }
                    }

                        
                        
                        
                        // Navigation link >>  qui va vers une autre page
                        
                        

                        VStack{
                            
                            Spacer()

                            NavigationLink(destination: Screen2()) {
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .foregroundColor(.orange)
                                
                                Text("Ajouter un membre")
                                    .foregroundColor(.orange)
                                    .padding()
                                    .cornerRadius(15)
                            }
                        }.navigationTitle("PROFIL")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .padding(.bottom)
        }
    }







struct Screen4_Previews: PreviewProvider {
    static var previews: some View {
        Screen4()
            .environmentObject(TaskData())
    }
}

